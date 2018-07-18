#**********************************************************************************************
#
#   raymath v1.2 - Math functions to work with Vector3, Matrix and Quaternions
#
#   CONFIGURATION:
#
#   #define RAYMATH_IMPLEMENTATION
#       Generates the implementation of the library into the included file.
#       If not defined, the library is in header only mode and can be included in other headers
#       or source files without problems. But only ONE file should hold the implementation.
#
#   #define RAYMATH_HEADER_ONLY
#       Define static inline functions code, so #include header suffices for use.
#       This may use up lots of memory.
#
#   #define RAYMATH_STANDALONE
#       Avoid raylib.h header inclusion in this file.
#       Vector3 and Matrix data types are defined internally in raymath module.
#
#
#   LICENSE: zlib/libpng
#
#   Copyright (c) 2015-2017 Ramon Santamaria (@raysan5)
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

import raylib_raylib

{.pragma: raymath, header: "<raymath.h>".}

#----------------------------------------------------------------------------------
# Defines and Macros
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# Types and Structures Definition
#----------------------------------------------------------------------------------

# NOTE: Helper types to be used instead of array return types for *ToFloat functions
type
  float3* {.importc, raymath.} = object
    v*: array[0..2, cfloat]

  float16* {.importc, raymath.} = object
    v*: array[0..15, cfloat]

#----------------------------------------------------------------------------------
# Module Functions Definition - Utils math
#----------------------------------------------------------------------------------

proc clamp*(value, min, max: cfloat): cfloat {.importc: "Clamp", raymath.} ## Clamp float value

#----------------------------------------------------------------------------------
# Module Functions Definition - Vector2 math
#----------------------------------------------------------------------------------

proc zero2*      (): Vector2 {.importc: "Vector2Zero", raymath.}                              ## Vector with components value 0.0f
proc one2*       (): Vector2 {.importc: "Vector2One", raymath.}                               ## Vector with components value 1.0f
proc `+`*        (v1: Vector2, v2: Vector2): Vector2 {.importc: "Vector2Add", raymath.}       ## Add two vectors           (v1 + v2)
proc `-`*        (v1: Vector2, v2: Vector2): Vector2 {.importc: "Vector2Subtract", raymath.}  ## Subtract two vectors (v1 - v2)
proc length*     (v: Vector2): cfloat {.importc: "Vector2Length", raymath.}                   ## Calculate vector length
proc dot_product*(v1: Vector2, v2: Vector2): cfloat {.importc: "Vector2DotProduct", raymath.} ## Calculate two vectors dot product
proc distance*   (v1: Vector2, v2: Vector2): cfloat {.importc: "Vector2Distance", raymath.}   ## Calculate distance between two vectors
proc angle*      (v1: Vector2, v2: Vector2): cfloat {.importc: "Vector2Angle", raymath.}      ## Calculate angle from two vectors in X-axis
proc `*`*        (v: Vector2, scale: cfloat): Vector2 {.importc: "Vector2Scale", raymath.}    ## Scale vector           (multiply by value)
proc negate*     (v: Vector2): Vector2 {.importc: "Vector2Negate", raymath.}                  ## Negate vector
proc `/`*        (v: Vector2, divv: cfloat): Vector2 {.importc: "Vector2Divide", raymath.}    ## Divide vector by a float value
proc normalize*  (v: Vector2): Vector2 {.importc: "Vector2Normalize", raymath.}               ## Normalize provided vector

#----------------------------------------------------------------------------------
# Module Functions Definition - Vector3 math
#----------------------------------------------------------------------------------

proc zero3*          (): Vector3 {.importc: "Vector3Zero", raymath.}                                         ## Vector with components value 0.0f
proc one3*           (): Vector3 {.importc: "Vector3One", raymath.}                                          ## Vector with components value 1.0f
proc `+`*            (v1: Vector3, v2: Vector3): Vector3 {.importc: "Vector3Add", raymath.}                  ## Add two vectors
proc `-`*            (v1: Vector3, v2: Vector3): Vector3 {.importc: "Vector3Subtract", raymath.}             ## Substract two vectors
proc `*`*            (v: Vector3, scalar: cfloat): Vector3 {.importc: "Vector3Multiply", raymath.}           ## Multiply vector by scalar
proc `*`*            (v1: Vector3, v2: Vector3): Vector3 {.importc: "Vector3MultiplyV", raymath.}            ## Multiply vector by vector
proc cross_product*  (v1: Vector3, v2: Vector3): Vector3 {.importc: "Vector3CrossProduct", raymath.}         ## Calculate two vectors cross product
proc perpendicular*  (v: Vector3): Vector3 {.importc: "Vector3Perpendicular", raymath.}                      ## Calculate one vector perpendicular vector
proc length*         (v: Vector3): cfloat {.importc: "Vector3Length", raymath.}                        ## Calculate vector length
proc dot_product*    (v1: Vector3, v2: Vector3): cfloat {.importc: "Vector3DotProduct", raymath.}            ## Calculate two vectors dot product
proc distance*       (v1: Vector3, v2: Vector3): cfloat {.importc: "Vector3Distance", raymath.}              ## Calculate distance between two vectors
proc scale*          (v: Vector3, scale: cfloat): Vector3 {.importc: "Vector3Scale", raymath.}               ## Scale provided vector
proc negate*         (v: Vector3): Vector3 {.importc: "Vector3Negate", raymath.}                             ## Negate provided vector (invert direction)
proc normalize*      (v: Vector3): Vector3 {.importc: "Vector3Normalize", raymath.}                          ## Normalize provided vector
proc ortho_normalize*(v1, v2: ptr Vector3) {.importc: "Vector3OrthoNormalize", raymath.}                     ## Orthonormalize provided vectors. Makes vectors normalized and orthogonal to each other. Gram-Schmidt function implementation.
proc transform*      (v: Vector3, mat: Matrix): Vector3 {.importc: "Vector3Transform", raymath.}             ## Transforms a Vector3 by a given Matrix
proc rotate*         (v: Vector3, q: Quaternion): Vector3 {.importc: "Vector3RotateByQuaternion", raymath.}  ## Transform a vector by quaternion rotation
proc lerp*           (v1: Vector3, v2: Vector3, amount: cfloat): Vector3 {.importc: "Vector3Lerp", raymath.} ## Calculate linear interpolation between two vectors
proc reflect*        (v: Vector3, normal: Vector3): Vector3 {.importc: "Vector3Reflect", raymath.}           ## Calculate reflected vector to normal
proc min*            (v1, v2: Vector3): Vector3 {.importc: "Vector3Min", raymath.}                           ## Return min value for each pair of components
proc max*            (v1, v2: Vector3): Vector3 {.importc: "Vector3Max", raymath.}                           ## Return max value for each pair of components
proc barycenter*     (p, a, b, c: Vector3): Vector3 {.importc: "Vector3Barycenter", raymath.}                ## Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c). NOTE: Assumes P is on the plane of the triangle
proc to_float_v*     (v: Vector3): float3 {.importc: "Vector3ToFloatV", raymath.}                            ## Returns Vector3 as float array

#----------------------------------------------------------------------------------
# Module Functions Definition - Matrix math
#----------------------------------------------------------------------------------

proc determinant*(mat: Matrix): cfloat {.importc: "MatrixDeterminant", raymath.}                                                                   ## Compute matrix determinant
proc trace*      (mat: Matrix): cfloat {.importc: "MatrixTrace", raymath.}                                                                         ## Returns the trace of the matrix (sum of the values along the diagonal)
proc transpose*  (mat: Matrix): Matrix {.importc: "MatrixTranspose", raymath.}                                                                     ## Transposes provided matrix
proc invert*     (mat: Matrix): Matrix {.importc: "MatrixInvert", raymath.}                                                                        ## Invert provided matrix
proc normalize*  (mat: Matrix): Matrix {.importc: "MatrixNormalize", raymath.}                                                                     ## Normalize provided matrix
proc identity*   (): Matrix {.importc: "MatrixIdentity", raymath.}                                                                                 ## Returns identity matrix
proc add*        (left: Matrix, right: Matrix): Matrix {.importc: "MatrixAdd", raymath.}                                                           ## Add two matrices
proc substract*  (left: Matrix, right: Matrix): Matrix {.importc: "MatrixSubstract", raymath.}                                                     ## Substract two matrices (left - right)
proc translate*  (x: cfloat, y: cfloat, z: cfloat): Matrix {.importc: "MatrixTranslate", raymath.}                                                 ## Returns translation matrix
proc rotate*     (axis: Vector3, angle: cfloat): Matrix {.importc: "MatrixRotate", raymath.}                                                       ## Create rotation matrix from axis and angle. NOTE: Angle should be provided in radians
proc rotate_x*   (angle: cfloat): Matrix {.importc: "MatrixRotateX", raymath.}                                                                     ## Returns x-rotation matrix (angle in radians)
proc rotate_y*   (angle: cfloat): Matrix {.importc: "MatrixRotateY", raymath.}                                                                     ## Returns y-rotation matrix (angle in radians)
proc rotate_z*   (angle: cfloat): Matrix {.importc: "MatrixRotateZ", raymath.}                                                                     ## Returns z-rotation matrix (angle in radians)
proc scale*      (x: cfloat, y: cfloat, z: cfloat): Matrix {.importc: "MatrixScale", raymath.}                                                     ## Returns scaling matrix
proc multiply*   (left, right: Matrix): Matrix {.importc: "MatrixMultiply", raymath.}                                                              ## Returns two matrix multiplication. NOTE: When multiplying matrices... the order matters!
proc frustum*    (left, right, bottom, top, near, far: cdouble): Matrix {.importc: "MatrixFrustum", raymath.}                                       ## Returns perspective projection matrix
proc perspective*(fovy, aspect, near, far: cdouble): Matrix {.importc: "MatrixPerspective", raymath.}                       ## Returns perspective projection matrix. NOTE: Angle should be provided in radians
proc ortho*      (left, right, bottom, top, near, far: cdouble): Matrix {.importc: "MatrixOrtho", raymath.} ## Returns orthographic projection matrix
proc look_at*    (eye: Vector3, target: Vector3, up: Vector3): Matrix {.importc: "MatrixLookAt", raymath.}                                         ## Returns camera look-at matrix (view matrix)
proc to_float_v* (mat: Matrix): float16 {.importc: "MatrixToFloatV", raymath.}                                                                     ## Returns float array of matrix data

#----------------------------------------------------------------------------------
# Module Functions Definition - Quaternion math
#----------------------------------------------------------------------------------

proc identity_quaternion*   (): Quaternion {.importc: "QuaternionIdentity", raymath.}                                                 ## Returns identity quaternion
proc length*                (q: Quaternion): cfloat {.importc: "QuaternionLength", raymath.}                                          ## Computes the length of a quaternion
proc normalize*             (q: Quaternion): Quaternion {.importc: "QuaternionNormalize", raymath.}                                   ## Normalize provided quaternion
proc invert*                (q: Quaternion): Quaternion {.importc: "QuaternionInvert", raymath.}                                      ## Invert provided quaternion
proc multiply*              (q1, q2: Quaternion): Quaternion {.importc: "QuaternionMultiply", raymath.}                               ## Calculate two quaternion multiplication
proc lerp*                  (q1, q2: Quaternion; amount: cfloat): Quaternion {.importc: "QuaternionLerp", raymath.}                   ## Calculate linear interpolation between two quaternions
proc nlerp*                 (q1, q2: Quaternion; amount: cfloat): Quaternion {.importc: "QuaternionNlerp", raymath.}                  ## Calculate slerp-optimized interpolation between two quaternions
proc slerp*                 (q1, q2: Quaternion; amount: cfloat): Quaternion {.importc: "QuaternionSlerp", raymath.}                  ## Calculates spherical linear interpolation between two quaternions
proc from_vector3To_vector3*(fromm: Vector3, to: Vector3): Quaternion {.importc: "QuaternionFromVector3ToVector3", raymath.}           ## Calculate quaternion based on the rotation from one vector to another
proc from_matrix*           (mat: Matrix): Quaternion {.importc: "QuaternionFromMatrix", raymath.}                                    ## Returns a quaternion for a given rotation matrix
proc to_matrix*             (q: Quaternion): Matrix {.importc: "QuaternionToMatrix", raymath.}                                        ## Returns a matrix for a given quaternion
proc from_axis_angle*       (axis: Vector3; angle: cfloat): Quaternion {.importc: "QuaternionFromAxisAngle", raymath.}                ## Returns rotation quaternion for an angle and axis. NOTE: angle must be provided in radians
proc to_axis_angle*         (q: Quaternion; outAxis: ptr Vector3; outAngle: ptr cfloat) {.importc: "QuaternionToAxisAngle", raymath.} ## Returns the rotation angle and axis for a given quaternion
proc from_euler*            (roll, pitch, yaw: cfloat): Quaternion {.importc: "QuaternionFromEuler", raymath.}                        ## Returns he quaternion equivalent to Euler angles
proc to_euler*              (q: Quaternion): Vector3 {.importc: "QuaternionToEuler", raymath.}                                        ## Return the Euler angles equivalent to quaternion (roll, pitch, yaw). NOTE: Angles are returned in a Vector3 struct in degrees
proc transform*             (q: Quaternion; mat: Matrix): Quaternion {.importc: "QuaternionTransform", raymath.}                      ## Transform a quaternion given a transformation matrix

