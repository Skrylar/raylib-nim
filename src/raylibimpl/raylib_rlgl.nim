#**********************************************************************************************
#
#   rlgl - raylib OpenGL abstraction layer
#
#   rlgl is a wrapper for multiple OpenGL versions (1.1, 2.1, 3.3 Core, ES 2.0) to
#   pseudo-OpenGL 1.1 style functions (rlVertex, rlTranslate, rlRotate...).
#
#   When chosing an OpenGL version greater than OpenGL 1.1, rlgl stores vertex data on internal
#   VBO buffers (and VAOs if available). It requires calling 3 functions:
#       rlglInit()  - Initialize internal buffers and auxiliar resources
#       rlglDraw()  - Process internal buffers and send required draw calls
#       rlglClose() - De-initialize internal buffers data and other auxiliar resources
#
#   CONFIGURATION:
#
#   #define GRAPHICS_API_OPENGL_11
#   #define GRAPHICS_API_OPENGL_21
#   #define GRAPHICS_API_OPENGL_33
#   #define GRAPHICS_API_OPENGL_ES2
#       Use selected OpenGL graphics backend, should be supported by platform
#       Those preprocessor defines are only used on rlgl module, if OpenGL version is
#       required by any other module, use rlGetVersion() tocheck it
#
#   #define RLGL_IMPLEMENTATION
#       Generates the implementation of the library into the included file.
#       If not defined, the library is in header only mode and can be included in other headers
#       or source files without problems. But only ONE file should hold the implementation.
#
#   #define RLGL_STANDALONE
#       Use rlgl as standalone library (no raylib dependency)
#
#   #define SUPPORT_VR_SIMULATOR
#       Support VR simulation functionality (stereo rendering)
#
#   #define SUPPORT_DISTORTION_SHADER
#       Include stereo rendering distortion shader (embedded)
#
#   DEPENDENCIES:
#       raymath     - 3D math functionality (Vector3, Matrix, Quaternion)
#       GLAD        - OpenGL extensions loading (OpenGL 3.3 Core only)
#
#
#   LICENSE: zlib/libpng
#
#   Copyright (c) 2014-2018 Ramon Santamaria (@raysan5)
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

import raylib_raylib, raylib_raymath

{.pragma: rlgl, header: "<rlgl.h>".}


#----------------------------------------------------------------------------------
# Defines and Macros
#----------------------------------------------------------------------------------

when defined(GRAPHICS_API_OPENGL_11) or defined(GRAPHICS_API_OPENGL_33):
  # NOTE: This is the maximum amount of lines, triangles and quads per frame, be careful!
  const
    MAX_LINES_BATCH*     = 8192
    MAX_TRIANGLES_BATCH* = 4096
    MAX_QUADS_BATCH*     = 8192
when defined(GRAPHICS_API_OPENGL_ES2):
  # NOTE: Reduce memory sizes for embedded systems (RPI and HTML5)
  # NOTE: On HTML5 (emscripten) this is allocated on heap, by default it's only 16MB!...just take care...
  const
    MAX_LINES_BATCH*     = 1024    ## Critical for wire shapes (sphere)
    MAX_TRIANGLES_BATCH* = 2048    ## Critical for some shapes (sphere)
    MAX_QUADS_BATCH*     = 1024    ## Be careful with text, every letter maps a quad

const
  # Texture parameters (equivalent to OpenGL defines)
  RL_TEXTURE_WRAP_S*               = 0x2802      ## GL_TEXTURE_WRAP_S
  RL_TEXTURE_WRAP_T*               = 0x2803      ## GL_TEXTURE_WRAP_T
  RL_TEXTURE_MAG_FILTER*           = 0x2800      ## GL_TEXTURE_MAG_FILTER
  RL_TEXTURE_MIN_FILTER*           = 0x2801      ## GL_TEXTURE_MIN_FILTER
  RL_TEXTURE_ANISOTROPIC_FILTER*   = 0x3000      ## Anisotropic filter (custom identifier)
  RL_FILTER_NEAREST*               = 0x2600      ## GL_NEAREST
  RL_FILTER_LINEAR*                = 0x2601      ## GL_LINEAR
  RL_FILTER_MIP_NEAREST*           = 0x2700      ## GL_NEAREST_MIPMAP_NEAREST
  RL_FILTER_NEAREST_MIP_LINEAR*    = 0x2702      ## GL_NEAREST_MIPMAP_LINEAR
  RL_FILTER_LINEAR_MIP_NEAREST*    = 0x2701      ## GL_LINEAR_MIPMAP_NEAREST
  RL_FILTER_MIP_LINEAR*            = 0x2703      ## GL_LINEAR_MIPMAP_LINEAR
  RL_WRAP_REPEAT*                  = 0x2901      ## GL_REPEAT
  RL_WRAP_CLAMP*                   = 0x812F      ## GL_CLAMP_TO_EDGE
  RL_WRAP_CLAMP_MIRROR*            = 0x8742      ## GL_MIRROR_CLAMP_EXT

const
  # Matrix modes (equivalent to OpenGL)
  RL_MODELVIEW*                    = 0x1700      ## GL_MODELVIEW
  RL_PROJECTION*                   = 0x1701      ## GL_PROJECTION
  RL_TEXTURE*                      = 0x1702      ## GL_TEXTURE

const
  # Primitive assembly draw modes
  RL_LINES*                        = 0x0001      ## GL_LINES
  RL_TRIANGLES*                    = 0x0004      ## GL_TRIANGLES
  RL_QUADS*                        = 0x0007      ## GL_QUADS

#----------------------------------------------------------------------------------
# Types and Structures Definition
#----------------------------------------------------------------------------------

type
  GlVersion* {.importc, rlgl.} = enum
    OPENGL_11 = 1
    OPENGL_21
    OPENGL_33
    OPENGL_ES_20

#------------------------------------------------------------------------------------
# Functions Declaration - Matrix operations
#------------------------------------------------------------------------------------

proc rlMatrixMode*(mode: cint) {.importc: "rlMatrixMode", rlgl.}                         ## Choose the current matrix to be transformed
proc rlPushMatrix*() {.importc: "rlPushMatrix", rlgl.}                                   ## Push the current matrix to stack
proc rlPopMatrix*() {.importc: "rlPopMatrix", rlgl.}                                     ## Pop lattest inserted matrix from stack
proc rlLoadIdentity*() {.importc: "rlLoadIdentity", rlgl.}                               ## Reset current matrix to identity matrix
proc rlTranslatef*(x, y, z: cfloat) {.importc: "rlTranslatef", rlgl.}                    ## Multiply the current matrix by a translation matrix
proc rlRotatef*(angleDeg, x, y, z: cfloat) {.importc: "rlRotatef", rlgl.}                ## Multiply the current matrix by a rotation matrix
proc rlScalef*(x, y, z: cfloat) {.importc: "rlScalef", rlgl.}                            ## Multiply the current matrix by a scaling matrix
proc rlMultMatrixf*(matf: ptr cfloat) {.importc: "rlMultMatrixf", rlgl.}                 ## Multiply the current matrix by another matrix
proc rlFrustum*(left, right, bottom, top, near, far: cdouble) {.importc: "rlFrustum", rlgl.} 
proc rlOrtho*(left, right, bottom, top, near, far: cdouble) {.importc: "rlOrtho", rlgl.} 
proc rlViewport*(x, y, width, height: cint) {.importc: "rlViewport", rlgl.}              ## Set the viewport area

#------------------------------------------------------------------------------------
# Functions Declaration - Vertex level operations
#------------------------------------------------------------------------------------

proc rlBegin*(mode: cint) {.importc: "rlBegin", rlgl.}                           ## Initialize drawing mode (how to organize vertex)
proc rlEnd*() {.importc: "rlEnd", rlgl.}                                         ## Finish vertex providing
proc rlVertex2i*(x, y: cint): cint {.importc: "rlVertex2i", rlgl.}               ## Define one vertex (position) - 2 cint
proc rlVertex2f*(x, y: cfloat): cfloat {.importc: "rlVertex2f", rlgl.}           ## Define one vertex (position) - 2 cfloat
proc rlVertex3f*(x, y, z: cfloat): cfloat {.importc: "rlVertex3f", rlgl.}        ## Define one vertex (position) - 3 cfloat
proc rlTexCoord2f*(x, y: cfloat): cfloat {.importc: "rlTexCoord2f", rlgl.}       ## Define one vertex (texture coordinate) - 2 cfloat
proc rlNormal3f*(x, y, z: cfloat): cfloat {.importc: "rlNormal3f", rlgl.}  ## Define one vertex (normal) - 3 cfloat
proc rlColor4ub*(r, g, b, a: uint8): uint8 {.importc: "rlColor4ub", rlgl.}       ## Define one vertex (color) - 4 uint8
proc rlColor3f*(x, y, z: cfloat): cfloat {.importc: "rlColor3f", rlgl.}          ## Define one vertex (color) - 3 cfloat
proc rlColor4f*(x, y, z, w: cfloat): cfloat {.importc: "rlColor4f", rlgl.}       ## Define one vertex (color) - 4 cfloat

#------------------------------------------------------------------------------------
# Functions Declaration - OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
# NOTE: This functions are used to completely abstract raylib code from OpenGL layer
#------------------------------------------------------------------------------------

proc rlEnableTexture*(id: cuint) {.importc: "rlEnableTexture", rlgl.}                                ## Enable texture usage
proc rlDisableTexture*() {.importc: "rlDisableTexture", rlgl.}                                       ## Disable texture usage
proc rlTextureParameters*(id: cuint; param, value: cint) {.importc: "rlTextureParameters", rlgl.}    ## Set texture parameters (filter, wrap)
proc rlEnableRenderTexture*(id: cuint) {.importc: "rlEnableRenderTexture", rlgl.}                    ## Enable render texture (fbo)
proc rlDisableRenderTexture*() {.importc: "rlDisableRenderTexture", rlgl.}                           ## Disable render texture (fbo), return to default framebuffer
proc rlEnableDepthTest*() {.importc: "rlEnableDepthTest", rlgl.}                                     ## Enable depth test
proc rlDisableDepthTest*() {.importc: "rlDisableDepthTest", rlgl.}                                   ## Disable depth test
proc rlEnableWireMode*() {.importc: "rlEnableWireMode", rlgl.}                                       ## Enable wire mode
proc rlDisableWireMode*() {.importc: "rlDisableWireMode", rlgl.}                                     ## Disable wire mode
proc rlDeleteTextures*(id: cuint) {.importc: "rlDeleteTextures", rlgl.}                              ## Delete OpenGL texture from GPU
proc rlDeleteRenderTextures*(target: RenderTexture2D) {.importc: "rlDeleteRenderTextures", rlgl.}    ## Delete render textures (fbo) from GPU
proc rlDeleteShader*(id: cuint) {.importc: "rlDeleteShader", rlgl.}                                  ## Delete OpenGL shader program from GPU
proc rlDeleteVertexArrays*(id: cuint) {.importc: "rlDeleteVertexArrays", rlgl.}                      ## Unload vertex data (VAO) from GPU memory
proc rlDeleteBuffers*(id: cuint) {.importc: "rlDeleteBuffers", rlgl.}                                ## Unload vertex data (VBO) from GPU memory
proc rlClearColor*(r, g, b, a: uint8) {.importc: "rlClearColor", rlgl.}                              ## Clear color buffer with color
proc rlClearScreenBuffers*() {.importc: "rlClearScreenBuffers", rlgl.}                               ## Clear used screen buffers (color and depth)

#------------------------------------------------------------------------------------
# Functions Declaration - rlgl functionality
#------------------------------------------------------------------------------------

proc rlglInit*(width, height: cint) {.importc: "rlglInit", rlgl.}                                                               ## Initialize rlgl (buffers, shaders, textures, states)
proc rlglClose*() {.importc: "rlglClose", rlgl.}                                                                                ## De-inititialize rlgl (buffers, shaders, textures)
proc rlglDraw*() {.importc: "rlglDraw", rlgl.}                                                                                  ## Update and Draw default buffers (lines, triangles, quads)
proc rlGetVersion*(): cint {.importc: "rlGetVersion", rlgl.}                                                                    ## Returns current OpenGL version
proc rlCheckBufferLimit*(typ, vCount: cint): cint {.importc: "rlCheckBufferLimit", rlgl.}                                       ## Check internal buffer overflow for a given number of vertex
proc rlSetDebugMarker*(text: cstring) {.importc: "rlSetDebugMarker", rlgl.}                                                     ## Set debug marker for analysis
proc rlLoadExtensions*(loader: pointer) {.importc: "rlLoadExtensions", rlgl.}                                                   ## Load OpenGL extensions
proc rlUnproject*(source: Vector3; proj: Matrix; view: Matrix): Vector3 {.importc: "rlUnproject", rlgl.}                        ## Get world coordinates from screen coordinates

# Textures data management
proc rlLoadTexture*(data: pointer, width, height: cint, format, mipmapCount: cint): cuint {.importc: "rlLoadTexture", rlgl.}    ## Load texture in GPU
proc rlUpdateTexture*(id: cuint, width, height, format: cint, data: pointer) {.importc: "rlUpdateTexture", rlgl.}               ## Update GPU texture with new data
proc rlUnloadTexture*(id: cuint) {.importc: "rlUnloadTexture", rlgl.}
proc rlGenerateMipmaps*(texture: ptr Texture2D) {.importc: "rlGenerateMipmaps", rlgl.}                                          ## Generate mipmap data for selected texture
proc rlReadTexturePixels*(texture: Texture2D): pointer {.importc: "rlReadTexturePixels", rlgl.}                                 ## Read texture pixel data
proc rlReadScreenPixels*(width, height: cint): ptr cuchar {.importc: "rlReadScreenPixels", rlgl.}                               ## Read screen pixel data (color buffer)
proc rlLoadRenderTexture*(width, height: cint): RenderTexture2D {.importc: "rlLoadRenderTexture", rlgl.}                        ## Load a texture to be used for rendering (fbo with color and depth attachments)

# Vertex data management
proc rlLoadMesh*(mesh: ptr Mesh, dynamic: cint) {.importc: "rlLoadMesh", rlgl.}                                                 ## Upload vertex data into GPU and provided VAO/VBO ids
proc rlUpdateMesh*(mesh: Mesh, buffer, numVertex: cint) {.importc: "rlUpdateMesh", rlgl.}                                       ## Update vertex data on GPU (upload new data to one buffer)
proc rlDrawMesh*(mesh: Mesh, material: Material, transform: Matrix) {.importc: "rlDrawMesh", rlgl.}                             ## Draw a 3d mesh with material and transform
proc rlUnloadMesh*(mesh: ptr Mesh) {.importc: "rlUnloadMesh", rlgl.}                                                            ## Unload mesh data from CPU and GPU

