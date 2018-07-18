#**********************************************************************************************
#
#   Physac v1.0 - 2D Physics library for videogames
#
#   DESCRIPTION:
#
#   Physac is a small 2D physics engine written in pure C. The engine uses a fixed time-step thread loop
#   to simluate physics. A physics step contains the following phases: get collision information,
#   apply dynamics, collision solving and position correction. It uses a very simple struct for physic
#   bodies with a position vector to be used in any 3D rendering API.
#
#   CONFIGURATION:
#
#   #define PHYSAC_IMPLEMENTATION
#       Generates the implementation of the library into the included file.
#       If not defined, the library is in header only mode and can be included in other headers
#       or source files without problems. But only ONE file should hold the implementation.
#
#   #define PHYSAC_STATIC (defined by default)
#       The generated implementation will stay private inside implementation file and all
#       internal symbols and functions will only be visible inside that file.
#
#   #define PHYSAC_NO_THREADS
#       The generated implementation won't include pthread library and user must create a secondary thread to call PhysicsThread().
#       It is so important that the thread where PhysicsThread() is called must not have v-sync or any other CPU limitation.
#
#   #define PHYSAC_STANDALONE
#       Avoid raylib.h header inclusion in this file. Data types defined on raylib are defined
#       internally in the library and input management and drawing functions must be provided by
#       the user (check library implementation for further details).
#
#   #define PHYSAC_DEBUG
#       Traces log messages when creating and destroying physics bodies and detects errors in physics
#       calculations and reference exceptions; it is useful for debug purposes
#
#   #define PHYSAC_MALLOC()
#   #define PHYSAC_FREE()
#       You can define your own malloc/free implementation replacing stdlib.h malloc()/free() functions.
#       Otherwise it will include stdlib.h and use the C standard library malloc()/free() function.
#
#
#   NOTE 1: Physac requires multi-threading, when InitPhysics() a second thread is created to manage physics calculations.
#   NOTE 2: Physac requires static C library linkage to avoid dependency on MinGW DLL (-static -lpthread)
#
#   Use the following code to compile:
#   gcc -o $(NAME_PART).exe $(FILE_NAME) -s -static -lraylib -lpthread -lopengl32 -lgdi32 -std=c99
#
#   VERY THANKS TO:
#       Ramon Santamaria (github: @raysan5)
#
#
#   LICENSE: zlib/libpng
#
#   Copyright (c) 2016-2018 Victor Fisac (github: @victorfisac)
#
#   This software is provided "as-is", without any express or implied warranty. In no event
#   will the authors be held liable for any damages arising from the use of this software.
#
#   Permission is granted to anyone to use this software for any purpose, including commercial
#   applications, and to alter it and redistribute it freely, subject to the following restrictions:
#
#     1. The origin of this software must not be misrepresented; you must not claim that you
#     wrote the original software. If you use this software in a product, an acknowledgment
#     in the product documentation would be appreciated but is not required.
#
#     2. Altered source versions must be plainly marked as such, and must not be misrepresented
#     as being the original software.
#
#     3. This notice may not be removed or altered from any source distribution.
#
#*********************************************************************************************/

{.pragma: physac, header: "<physac.h>".}

import raylib_raylib

const
  PHYSAC_MAX_BODIES*               = 64
  PHYSAC_MAX_MANIFOLDS*            = 4096
  PHYSAC_MAX_VERTICES*             = 24
  PHYSAC_CIRCLE_VERTICES*          = 24
  PHYSAC_DESIRED_DELTATIME*        = 1.0 / 60.0
  PHYSAC_MAX_TIMESTEP*             = 0.02
  PHYSAC_COLLISION_ITERATIONS*     = 100
  PHYSAC_PENETRATION_ALLOWANCE*    = 0.05
  PHYSAC_PENETRATION_CORRECTION*   = 0.4

type
  PhysicsShapeType* {.importc, physac.} = enum
    PHYSICS_CIRCLE
    PHYSICS_POLYGON

  Mat2* {.importc, physac.} = object
    ## Mat2 type (used for polygon shape rotation matrix)
    m00*: cfloat
    m01*: cfloat
    m10*: cfloat
    m11*: cfloat

  PolygonData* {.importc, physac.} = object
    vertexCount*: cuint                                    ## Current used vertex and normals count
    positions*: array[0..(PHYSAC_MAX_VERTICES-1), Vector2] ## Polygon vertex positions vectors
    normals*: array[0..(PHYSAC_MAX_VERTICES-1), Vector2]   ## Polygon vertex normals vectors
  Polygon* = ptr PolygonData

  PhysicsShape* {.importc, physac.} = object
    `type`*: PhysicsShapeType                              ## Physics shape type (circle or polygon)
    body*: PhysicsBody                                     ## Shape physics body reference
    radius*: cfloat                                        ## Circle shape radius (used for circle shapes)
    transform*: Mat2                                       ## Vertices transform matrix 2x2
    vertexData*: PolygonData                               ## Polygon shape vertices position and normals data (just used for polygon shapes)

  PhysicsBodyData* {.importc, physac.} = object
    id*: cuint                                             ## Reference unique identifier
    enabled*: bool                                         ## Enabled dynamics state (collisions are calculated anyway)
    position*: Vector2                                     ## Physics body shape pivot
    velocity*: Vector2                                     ## Current linear velocity applied to position
    force*: Vector2                                        ## Current linear force (reset to 0 every step)
    angularVelocity*: cfloat                               ## Current angular velocity applied to orient
    torque*: cfloat                                        ## Current angular force (reset to 0 every step)
    orient*: cfloat                                        ## Rotation in radians
    inertia*: cfloat                                       ## Moment of inertia
    inverseInertia*: cfloat                                ## Inverse value of inertia
    mass*: cfloat                                          ## Physics body mass
    inverseMass*: cfloat                                   ## Inverse value of mass
    staticFriction*: cfloat                                ## Friction when the body has not movement (0 to 1)
    dynamicFriction*: cfloat                               ## Friction when the body has movement (0 to 1)
    restitution*: cfloat                                   ## Restitution coefficient of the body (0 to 1)
    useGravity*: bool                                      ## Apply gravity force to dynamics
    isGrounded*: bool                                      ## Physics grounded on other body state
    freezeOrient*: bool                                    ## Physics rotation constraint
    shape*: PhysicsShape                                   ## Physics body shape information (type, radius, vertices, normals)
  PhysicsBody* = ptr PhysicsBodyData

  PhysicsManifoldData* {.importc, physac.} = object
    id*: cuint                                             ## Reference unique identifier
    bodyA*: PhysicsBody                                    ## Manifold first physics body reference
    bodyB*: PhysicsBody                                    ## Manifold second physics body reference
    penetration*: cfloat                                   ## Depth of penetration from collision
    normal*: Vector2                                       ## Normal direction vector from 'a' to 'b'
    contacts*: array[0..1, Vector2]                        ## Points of contact during collision
    contactsCount*: cuint                                  ## Current collision number of contacts
    restitution*: cfloat                                   ## Mixed restitution during collision
    dynamicFriction*: cfloat                               ## Mixed dynamic friction during collision
    staticFriction*: cfloat                                ## Mixed static friction during collision
  PhysicsManifold* = ptr PhysicsManifoldData

#----------------------------------------------------------------------------------
# Module Functions Declaration
#----------------------------------------------------------------------------------

proc init_physics*() {.importc: "InitPhysics", physac.}                                                                                                          ## Initializes physics values, pointers and creates physics loop thread
proc is_physics_enabled*(): cint {.importc: "IsPhysicsEnabled", physac.}                                                                                         ## Returns true if physics thread is currently enabled
proc set_physics_gravity*(x: cfloat, y: cfloat) {.importc: "SetPhysicsGravity", physac.}                                                                         ## Sets physics global gravity force
proc create_physics_body_circle*(pos: Vector2, radius: cfloat, density: cfloat): PhysicsBody {.importc: "CreatePhysicsBodyCircle", physac.}                      ## Creates a new circle physics body with generic parameters
proc create_physics_body_rectangle*(pos: Vector2, width: cfloat, height: cfloat, density: cfloat): PhysicsBody {.importc: "CreatePhysicsBodyRectangle", physac.} ## Creates a new rectangle physics body with generic parameters
proc create_physics_body_polygon*(pos: Vector2, radius: cfloat, sides: cint, density: cfloat): PhysicsBody {.importc: "CreatePhysicsBodyPolygon", physac.}       ## Creates a new polygon physics body with generic parameters
proc add_force*(body: PhysicsBody, force: Vector2) {.importc: "PhysicsAddForce", physac.}                                                                        ## Adds a force to a physics body
proc add_torque*(body: PhysicsBody, amount: cfloat) {.importc: "PhysicsAddTorque", physac.}                                                                      ## Adds an angular force to a physics body
proc shatter*(body: PhysicsBody, position: Vector2, force: cfloat) {.importc: "PhysicsShatter", physac.}                                                         ## Shatters a polygon shape physics body to little physics bodies with explosion force
proc get_physics_bodies_count*(): cint {.importc: "GetPhysicsBodiesCount", physac.}                                                                              ## Returns the current amount of created physics bodies
proc get_physics_body*(index: cint): PhysicsBody {.importc: "GetPhysicsBody", physac.}                                                                           ## Returns a physics body of the bodies pool at a specific index
proc get_physics_shape_type*(index: cint): cint {.importc: "GetPhysicsShapeType", physac.}                                                                       ## Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)
proc get_physics_shape_vertices_count*(index: cint): cint {.importc: "GetPhysicsShapeVerticesCount", physac.}                                                    ## Returns the amount of vertices of a physics body shape
proc get_physics_shape_vertex*(body: PhysicsBody, vertex: cint): Vector2 {.importc: "GetPhysicsShapeVertex", physac.}                                            ## Returns transformed position of a body shape (body position + vertex transformed position)
proc `body_rotation=`*(body: PhysicsBody, radians: cfloat) {.importc: "SetPhysicsBodyRotation", physac.}                                                         ## Sets physics body shape transform based on radians parameter
proc destroy*(body: PhysicsBody) {.importc: "DestroyPhysicsBody", physac.}                                                                                       ## Unitializes and destroy a physics body
proc reset_physics*() {.importc: "ResetPhysics", physac.}                                                                                                        ## Destroys created physics bodies and manifolds and resets global values
proc close_physics*() {.importc: "ClosePhysics", physac.}                                                                                                        ## Unitializes physics pointers and closes physics loop thread

