#**********************************************************************************************
#
#   raylib - A simple and easy-to-use library to learn videogames programming (www.raylib.com)
#
#   FEATURES:
#       - NO external dependencies, all required libraries included with raylib
#       - Multiple platforms support: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly, MacOS, UWP, Android, Raspberry Pi, HTML5.
#       - Written in plain C code (C99) in PascalCase/camelCase notation
#       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3 or ES2 - choose at compile)
#       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
#       - Powerful fonts module with Fonts support (XNA fonts, AngelCode fonts, TTF)
#       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
#       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
#       - Flexible Materials system, supporting classic maps and PBR maps
#       - Shaders support, including Model shaders and Postprocessing shaders
#       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
#       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
#       - VR stereo rendering with configurable HMD device parameters
#       - Complete bindings to LUA (raylib-lua) and Go (raylib-go)
#
#   NOTES:
#       One custom font is loaded by default when InitWindow() [core]
#       If using OpenGL 3.3 or ES2, one default shader is loaded automatically (internally defined) [rlgl]
#       If using OpenGL 3.3 or ES2, several vertex buffers (VAO/VBO) are created to manage lines-triangles-quads
#
#   DEPENDENCIES (included):
#       rglfw (github.com/glfw/glfw) for window/context management and input (only PLATFORM_DESKTOP) [core]
#       glad (github.com/Dav1dde/glad) for OpenGL extensions loading (3.3 Core profile, only PLATFORM_DESKTOP) [rlgl]
#       mini_al (github.com/dr-soft/mini_al) for audio device/context management [audio]
#
#   OPTIONAL DEPENDENCIES (included):
#       stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...) [textures]
#       stb_image_resize (Sean Barret) for image resizing algorythms [textures]
#       stb_image_write (Sean Barret) for image writting (PNG) [utils]
#       stb_truetype (Sean Barret) for ttf fonts loading [text]
#       stb_rect_pack (Sean Barret) for rectangles packing [text]
#       stb_vorbis (Sean Barret) for OGG audio loading [audio]
#       stb_perlin (Sean Barret) for Perlin noise image generation [textures]
#       par_shapes (Philip Rideout) for parametric 3d shapes generation [models]
#       jar_xm (Joshua Reisenauer) for XM audio module loading [audio]
#       jar_mod (Joshua Reisenauer) for MOD audio module loading [audio]
#       dr_flac (David Reid) for FLAC audio file loading [audio]
#       dr_mp3 (David Reid) for MP3 audio file loading [audio]
#       rgif (Charlie Tangora, Ramon Santamaria) for GIF recording [core]
#
#
#   LICENSE: zlib/libpng
#
#   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software:
#
#   Copyright (c) 2013-2018 Ramon Santamaria (@raysan5)
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

{.pragma: raylib, header: "<raylib.h>".}

#const
#    PI* = 3.14159265358979323846
#define DEG2RAD (PI/180.0f)
#define RAD2DEG (180.0f/PI)

const
  FLAG_SHOW_LOGO*            =  1       ## Set to show raylib logo at startup
  FLAG_FULLSCREEN_MODE*      =  2       ## Set to run program in fullscreen
  FLAG_WINDOW_RESIZABLE*     =  4       ## Set to allow resizable window
  FLAG_WINDOW_UNDECORATED*   =  8       ## Set to disable window decoration (frame and buttons)
  FLAG_WINDOW_TRANSPARENT*   = 16       ## Set to allow transparent window
  FLAG_MSAA_4X_HINT*         = 32       ## Set to try enabling MSAA 4X
  FLAG_VSYNC_HINT*           = 64       ## Set to try enabling V-Sync on GPU

const
  KEY_SPACE*                      = 32
  KEY_ESCAPE*                     = 256
  KEY_ENTER*                      = 257
  KEY_TAB*                        = 258
  KEY_BACKSPACE*                  = 259
  KEY_INSERT*                     = 260
  KEY_DELETE*                     = 261
  KEY_RIGHT*                      = 262
  KEY_LEFT*                       = 263
  KEY_DOWN*                       = 264
  KEY_UP*                         = 265
  KEY_PAGE_UP*                    = 266
  KEY_PAGE_DOWN*                  = 267
  KEY_HOME*                       = 268
  KEY_END*                        = 269
  KEY_CAPS_LOCK*                  = 280
  KEY_SCROLL_LOCK*                = 281
  KEY_NUM_LOCK*                   = 282
  KEY_PRINT_SCREEN*               = 283
  KEY_PAUSE*                      = 284
  KEY_F1*                         = 290
  KEY_F2*                         = 291
  KEY_F3*                         = 292
  KEY_F4*                         = 293
  KEY_F5*                         = 294
  KEY_F6*                         = 295
  KEY_F7*                         = 296
  KEY_F8*                         = 297
  KEY_F9*                         = 298
  KEY_F10*                        = 299
  KEY_F11*                        = 300
  KEY_F12*                        = 301
  KEY_LEFT_SHIFT*                 = 340
  KEY_LEFT_CONTROL*               = 341
  KEY_LEFT_ALT*                   = 342
  KEY_RIGHT_SHIFT*                = 344
  KEY_RIGHT_CONTROL*              = 345
  KEY_RIGHT_ALT*                  = 346
  KEY_GRAVE*                      = 96
  KEY_SLASH*                      = 47
  KEY_BACKSLASH*                  = 92
  KEY_ZERO*                       = 48
  KEY_ONE*                        = 49
  KEY_TWO*                        = 50
  KEY_THREE*                      = 51
  KEY_FOUR*                       = 52
  KEY_FIVE*                       = 53
  KEY_SIX*                        = 54
  KEY_SEVEN*                      = 55
  KEY_EIGHT*                      = 56
  KEY_NINE*                       = 57
  KEY_A*                          = 65
  KEY_B*                          = 66
  KEY_C*                          = 67
  KEY_D*                          = 68
  KEY_E*                          = 69
  KEY_F*                          = 70
  KEY_G*                          = 71
  KEY_H*                          = 72
  KEY_I*                          = 73
  KEY_J*                          = 74
  KEY_K*                          = 75
  KEY_L*                          = 76
  KEY_M*                          = 77
  KEY_N*                          = 78
  KEY_O*                          = 79
  KEY_P*                          = 80
  KEY_Q*                          = 81
  KEY_R*                          = 82
  KEY_S*                          = 83
  KEY_T*                          = 84
  KEY_U*                          = 85
  KEY_V*                          = 86
  KEY_W*                          = 87
  KEY_X*                          = 88
  KEY_Y*                          = 89
  KEY_Z*                          = 90
  KEY_BACK*                       = 4
  KEY_MENU*                       = 82
  KEY_VOLUME_UP*                  = 24
  KEY_VOLUME_DOWN*                = 25
  MOUSE_LEFT_BUTTON*              = 0
  MOUSE_RIGHT_BUTTON*             = 1
  MOUSE_MIDDLE_BUTTON*            = 2
  MAX_TOUCH_POINTS*               = 2
  GAMEPAD_PLAYER1*                = 0
  GAMEPAD_PLAYER2*                = 1
  GAMEPAD_PLAYER3*                = 2
  GAMEPAD_PLAYER4*                = 3
  GAMEPAD_PS3_BUTTON_TRIANGLE*    = 0
  GAMEPAD_PS3_BUTTON_CIRCLE*      = 1
  GAMEPAD_PS3_BUTTON_CROSS*       = 2
  GAMEPAD_PS3_BUTTON_SQUARE*      = 3
  GAMEPAD_PS3_BUTTON_L1*          = 6
  GAMEPAD_PS3_BUTTON_R1*          = 7
  GAMEPAD_PS3_BUTTON_L2*          = 4
  GAMEPAD_PS3_BUTTON_R2*          = 5
  GAMEPAD_PS3_BUTTON_START*       = 8
  GAMEPAD_PS3_BUTTON_SELECT*      = 9
  GAMEPAD_PS3_BUTTON_UP*          = 24
  GAMEPAD_PS3_BUTTON_RIGHT*       = 25
  GAMEPAD_PS3_BUTTON_DOWN*        = 26
  GAMEPAD_PS3_BUTTON_LEFT*        = 27
  GAMEPAD_PS3_BUTTON_PS*          = 12
  GAMEPAD_PS3_AXIS_LEFT_X*        = 0
  GAMEPAD_PS3_AXIS_LEFT_Y*        = 1
  GAMEPAD_PS3_AXIS_RIGHT_X*       = 2
  GAMEPAD_PS3_AXIS_RIGHT_Y*       = 5
  GAMEPAD_PS3_AXIS_L2*            = 3       ## [1..-1] (pressure-level)
  GAMEPAD_PS3_AXIS_R2*            = 4       ## [1..-1] (pressure-level)
  GAMEPAD_XBOX_BUTTON_A*          = 0
  GAMEPAD_XBOX_BUTTON_B*          = 1
  GAMEPAD_XBOX_BUTTON_X*          = 2
  GAMEPAD_XBOX_BUTTON_Y*          = 3
  GAMEPAD_XBOX_BUTTON_LB*         = 4
  GAMEPAD_XBOX_BUTTON_RB*         = 5
  GAMEPAD_XBOX_BUTTON_SELECT*     = 6
  GAMEPAD_XBOX_BUTTON_START*      = 7
  GAMEPAD_XBOX_BUTTON_UP*         = 10
  GAMEPAD_XBOX_BUTTON_RIGHT*      = 11
  GAMEPAD_XBOX_BUTTON_DOWN*       = 12
  GAMEPAD_XBOX_BUTTON_LEFT*       = 13
  GAMEPAD_XBOX_BUTTON_HOME*       = 8
  GAMEPAD_ANDROID_DPAD_UP*        = 19
  GAMEPAD_ANDROID_DPAD_DOWN*      = 20
  GAMEPAD_ANDROID_DPAD_LEFT*      = 21
  GAMEPAD_ANDROID_DPAD_RIGHT*     = 22
  GAMEPAD_ANDROID_DPAD_CENTER*    = 23
  GAMEPAD_ANDROID_BUTTON_A*       = 96
  GAMEPAD_ANDROID_BUTTON_B*       = 97
  GAMEPAD_ANDROID_BUTTON_C*       = 98
  GAMEPAD_ANDROID_BUTTON_X*       = 99
  GAMEPAD_ANDROID_BUTTON_Y*       = 100
  GAMEPAD_ANDROID_BUTTON_Z*       = 101
  GAMEPAD_ANDROID_BUTTON_L1*      = 102
  GAMEPAD_ANDROID_BUTTON_R1*      = 103
  GAMEPAD_ANDROID_BUTTON_L2*      = 104
  GAMEPAD_ANDROID_BUTTON_R2*      = 105

when defined(PLATFORM_RPI):
  const
    GAMEPAD_XBOX_AXIS_LEFT_X*    = 0   ## [-1..1] (left->right)
    GAMEPAD_XBOX_AXIS_LEFT_Y*    = 1   ## [-1..1] (up->down)
    GAMEPAD_XBOX_AXIS_RIGHT_X*   = 3   ## [-1..1] (left->right)
    GAMEPAD_XBOX_AXIS_RIGHT_Y*   = 4   ## [-1..1] (up->down)
    GAMEPAD_XBOX_AXIS_LT*        = 2   ## [-1..1] (pressure-level)
    GAMEPAD_XBOX_AXIS_RT*        = 5   ## [-1..1] (pressure-level)
else:
  const
    GAMEPAD_XBOX_AXIS_LEFT_X*    = 0   ## [-1..1] (left->right)
    GAMEPAD_XBOX_AXIS_LEFT_Y*    = 1   ## [1..-1] (up->down)
    GAMEPAD_XBOX_AXIS_RIGHT_X*   = 2   ## [-1..1] (left->right)
    GAMEPAD_XBOX_AXIS_RIGHT_Y*   = 3   ## [1..-1] (up->down)
    GAMEPAD_XBOX_AXIS_LT*        = 4   ## [-1..1] (pressure-level)
    GAMEPAD_XBOX_AXIS_RT*        = 5   ## [-1..1] (pressure-level)

const
  MAX_SHADER_LOCATIONS*       = 32 ## Maximum number of predefined locations stored in shader struct
  MAX_MATERIAL_MAPS*          = 12 ## Maximum number of texture maps stored in shader struct

#----------------------------------------------------------------------------------
# Structures Definition
#----------------------------------------------------------------------------------

type
  # XXX this is C++'s bool in a c++ build, and a custom enum
  # (identical to C++ bool) in a C99 build
  raybool = int

  Vector2* {.importc, raylib.} = object
    ## Vector2 type
    x*: cfloat
    y*: cfloat

  Vector3* {.importc, raylib.} = object
    ## Vector3 type
    x*: cfloat
    y*: cfloat
    z*: cfloat

  Vector4* {.importc, raylib.} = object
    ## Vector4 type
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

  Quaternion* = Vector4
    ## Quaternion type, same as Vector4

  Matrix* {.importc, raylib.} = object
    ## Matrix type (OpenGL style 4x4 - right handed, column major)
    m0*, m4*, m8*, m12*: cfloat
    m1*, m5*, m9*, m13*: cfloat
    m2*, m6*, m10*, m14*: cfloat
    m3*, m7*, m11*, m15*: cfloat

  Color* {.importc, raylib.} = object
    ## Color type, RGBA (32bit)
    r*: uint8
    g*: uint8
    b*: uint8
    a*: uint8

const
  LIGHTGRAY*  = Color(r: 200, g: 200, b: 200, a: 255)  ## Light Gray
  GRAY*       = Color(r: 130, g: 130, b: 130, a: 255)  ## Gray
  DARKGRAY*   = Color(r: 80 , g: 80 , b: 80 , a: 255)  ## Dark Gray
  YELLOW*     = Color(r: 253, g: 249, b: 0  , a: 255)  ## Yellow
  GOLD*       = Color(r: 255, g: 203, b: 0  , a: 255)  ## Gold
  ORANGE*     = Color(r: 255, g: 161, b: 0  , a: 255)  ## Orange
  PINK*       = Color(r: 255, g: 109, b: 194, a: 255)  ## Pink
  RED*        = Color(r: 230, g: 41 , b: 55 , a: 255)  ## Red
  MAROON*     = Color(r: 190, g: 33 , b: 55 , a: 255)  ## Maroon
  GREEN*      = Color(r: 0  , g: 228, b: 48 , a: 255)  ## Green
  LIME*       = Color(r: 0  , g: 158, b: 47 , a: 255)  ## Lime
  DARKGREEN*  = Color(r: 0  , g: 117, b: 44 , a: 255)  ## Dark Green
  SKYBLUE*    = Color(r: 102, g: 191, b: 255, a: 255)  ## Sky Blue
  BLUE*       = Color(r: 0  , g: 121, b: 241, a: 255)  ## Blue
  DARKBLUE*   = Color(r: 0  , g: 82 , b: 172, a: 255)  ## Dark Blue
  PURPLE*     = Color(r: 200, g: 122, b: 255, a: 255)  ## Purple
  VIOLET*     = Color(r: 135, g: 60 , b: 190, a: 255)  ## Violet
  DARKPURPLE* = Color(r: 112, g: 31 , b: 126, a: 255)  ## Dark Purple
  BEIGE*      = Color(r: 211, g: 176, b: 131, a: 255)  ## Beige
  BROWN*      = Color(r: 127, g: 106, b: 79 , a: 255)  ## Brown
  DARKBROWN*  = Color(r: 76 , g: 63 , b: 47 , a: 255)  ## Dark Brown
  WHITE*      = Color(r: 255, g: 255, b: 255, a: 255)  ## White
  BLACK*      = Color(r: 0  , g: 0  , b: 0  , a: 255)  ## Black
  BLANK*      = Color(r: 0  , g: 0  , b: 0  , a: 0)    ## Blank (Transparent)
  MAGENTA*    = Color(r: 255, g: 0  , b: 255, a: 255)  ## Magenta
  RAYWHITE*   = Color(r: 245, g: 245, b: 245, a: 255)  ## My own White (raylib logo)

type
  Rectangle* {.importc, raylib.} = object
    ## Rectangle type
    x: cfloat
    y: cfloat
    width: cfloat
    height: cfloat

  Image* {.importc, raylib.} = object
    ## Image type, bpp always RGBA (32bit)
    ## NOTE: Data stored in CPU memory (RAM)
    data: pointer   ## Image raw data
    width: cint     ## Image base width
    height: cint    ## Image base height
    mipmaps: cint   ## Mipmap levels, 1 by default
    format: cint    ## Data format (PixelFormat type)

  Texture2D* {.importc, raylib.} = object
    ## Texture2D type
    ## NOTE: Data stored in GPU memory
    id: cuint       ## OpenGL texture id
    width: cint     ## Texture base width
    height: cint    ## Texture base height
    mipmaps: cint   ## Mipmap levels, 1 by default
    format: cint    ## Data format (PixelFormat type)

  Texture* = Texture2D ## Texture type, same as Texture2D

  RenderTexture2D* {.importc, raylib.} = object
    ## RenderTexture2D type, for texture rendering
    id*: cuint            ## OpenGL Framebuffer Object (FBO) id
    texture*: Texture2D   ## Color buffer attachment texture
    depth*: Texture2D     ## Depth buffer attachment texture

  RenderTexture* = RenderTexture2D
    ## RenderTexture type, same as RenderTexture2D

  CharInfo* {.importc, raylib.} = object
    ## Font character info
    value*: cint          ## Character value (Unicode)
    rec*: Rectangle       ## Character rectangle in sprite font
    offsetX*: cint        ## Character offset X when drawing
    offsetY*: cint        ## Character offset Y when drawing
    advanceX*: cint       ## Character advance position X
    data*: ptr cuchar     ## Character pixel data (grayscale)

  Font* {.importc, raylib.} = object
    ## Font type, includes texture and charSet array data
    texture*: Texture2D   ## Font texture
    baseSize*: cint       ## Base size (default chars height)
    charsCount*: cint     ## Number of characters
    chars*: ptr CharInfo  ## Characters info data

  SpriteFont* = Font ## SpriteFont type fallback, defaults to Font object

  Camera3D* {.importc, raylib.} = object
    ## Camera type, defines a camera position/orientation in 3d space
    position*: Vector3  ## Camera position
    target*: Vector3    ## Camera target it looks-at
    up*: Vector3        ## Camera up vector (rotation over its axis)
    fovy*: cfloat       ## Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    `type`*: cint       ## Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

  Camera* = Camera3D ## Camera type fallback, defaults to Camera3D

  Camera2D* {.importc, raylib.} = object
    ## Camera2D type, defines a 2d camera
    offset*: Vector2      ## Camera offset (displacement from target)
    target*: Vector2      ## Camera target (rotation and zoom origin)
    rotation*: cfloat     ## Camera rotation in degrees
    zoom*: cfloat         ## Camera zoom (scaling), should be 1.0f by default

  BoundingBox* {.importc, raylib.} = object
    ## Bounding box type
    min*: Vector3         ## Minimum vertex box-corner
    max*: Vector3         ## Maximum vertex box-corner

  Mesh* {.importc, raylib.} = object
    ## Vertex data definning a mesh. NOTE: Data stored in CPU memory (and GPU)
    vertexCount*: cint            ## Number of vertices stored in arrays
    triangleCount*: cint          ## Number of triangles stored (indexed or not)
    vertices*: ptr cfloat         ## Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    texcoords*: ptr cfloat        ## Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    texcoords2*: ptr cfloat       ## Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
    normals*: ptr cfloat          ## Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    tangents*: ptr cfloat         ## Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    colors*: ptr cuchar           ## Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    indices*: ptr cushort         ## Vertex indices (in case vertex data comes indexed)
    vaoId*: cuint                 ## OpenGL Vertex Array Object id
    vboId*: array[0..6, cuint]    ## OpenGL Vertex Buffer Objects id (7 types of vertex data)

  Shader* {.importc, raylib.} = object
    ## Shader type (generic)
    id*: cuint                                           ##  Shader program id
    locs*: array[0..(MAX_SHADER_LOCATIONS-1), cint]      ##  Shader locations array

  MaterialMap* {.importc, raylib.} = object
    ## Material texture map
    texture*: Texture2D                                  ##  Material map texture
    color*: Color                                        ##  Material map color
    value*: cfloat                                       ##  Material map value

  Material* {.importc, raylib.} = object
    ## Material type (generic)
    shader*: Shader                                      ##  Material shader
    maps*: array[0..(MAX_MATERIAL_MAPS-1), MaterialMap]  ##  Material maps
    params*: ptr cfloat                                  ##  Material generic parameters (if required)

  Model* {.importc, raylib.} = object
    ## Model type
    mesh*: Mesh                                          ##  Vertex data buffers (RAM and VRAM)
    transform*: Matrix                                   ##  Local transform matrix
    material*: Material                                  ##  Shader and textures data

  Ray* {.importc, raylib.} = object
    ## Ray type (useful for raycast)
    position*: Vector3                                   ##  Ray position (origin)
    direction*: Vector3                                  ##  Ray direction

  RayHitInfo* {.importc, raylib.} = object
    ## Raycast hit information
    hit*: raybool                               ## Did the ray hit something?
    distance*: cfloat                           ## Distance to nearest hit
    position*: Vector3                          ## Position of nearest hit
    normal*: Vector3                            ## Surface normal of hit

  Wave* {.importc, raylib.} = object
    ## Wave type, defines audio wave data
    sampleCount*: cuint                         ## Number of samples
    sampleRate*: cuint                          ## Frequency (samples per second)
    sampleSize*: cuint                          ## Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels*: cuint                            ## Number of channels (1-mono, 2-stereo)
    data*: pointer                              ## Buffer data pointer

  Sound* {.importc, raylib.} = object
    ## Sound source type
    audioBuffer*: pointer                       ## Pointer to internal data used by the audio system
    source*: cuint                              ## Audio source id
    buffer*: cuint                              ## Audio buffer id
    format*: cint                               ## Audio format specifier

  Music* {.importc, raylib, incompleteStruct.} = object
    ## Music type (file streaming from memory). NOTE: Anything longer
    ## than ~10 seconds should be streamed

  AudioStream* {.importc, raylib.} = object
    ## Audio stream type
    ## NOTE: Useful to create custom audio streams not bound to a specific file
    sampleRate*: cuint                          ## Frequency (samples per second)
    sampleSize*: cuint                          ## Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels*: cuint                            ## Number of channels (1-mono, 2-stereo)
    audioBuffer*: pointer                       ## Pointer to internal data used by the audio system.
    format*: cint                               ## Audio format specifier
    source*: cuint                              ## Audio source id
    buffers*: array[0..1, cuint]                ## Audio buffers (double buffering)

  VrDeviceInfo* {.importc, raylib.} = object
    ## Head-Mounted-Display device parameters
    hResolution*: cint                          ## HMD horizontal resolution in pixels
    vResolution*: cint                          ## HMD vertical resolution in pixels
    hScreenSize*: cfloat                        ## HMD horizontal size in meters
    vScreenSize*: cfloat                        ## HMD vertical size in meters
    vScreenCenter*: cfloat                      ## HMD screen center in meters
    eyeToScreenDistance*: cfloat                ## HMD distance between eye and display in meters
    lensSeparationDistance*: cfloat             ## HMD lens separation distance in meters
    interpupillaryDistance*: cfloat             ## HMD IPD (distance between pupils) in meters
    lensDistortionValues*: array[0..3, cfloat]  ## HMD lens distortion constant parameters
    chromaAbCorrection*: array[0..3, cfloat]    ## HMD chromatic aberration correction parameters

#----------------------------------------------------------------------------------
# Enumerators Definition
#----------------------------------------------------------------------------------

type
  LogType* {.importc, raylib.} = enum
    ## Trace log type
    LOG_INFO    = 1
    LOG_WARNING = 2
    LOG_ERROR   = 4
    LOG_DEBUG   = 8
    LOG_OTHER   = 16

  ShaderLocationIndex* {.importc, raylib.} = enum
    ## Shader location point type
    LOC_VERTEX_POSITION = 0
    LOC_VERTEX_TEXCOORD01
    LOC_VERTEX_TEXCOORD02
    LOC_VERTEX_NORMAL
    LOC_VERTEX_TANGENT
    LOC_VERTEX_COLOR
    LOC_MATRIX_MVP
    LOC_MATRIX_MODEL
    LOC_MATRIX_VIEW
    LOC_MATRIX_PROJECTION
    LOC_VECTOR_VIEW
    LOC_COLOR_DIFFUSE
    LOC_COLOR_SPECULAR
    LOC_COLOR_AMBIENT
    LOC_MAP_ALBEDO          ## LOC_MAP_DIFFUSE
    LOC_MAP_METALNESS       ## LOC_MAP_SPECULAR
    LOC_MAP_NORMAL
    LOC_MAP_ROUGHNESS
    LOC_MAP_OCCLUSION
    LOC_MAP_EMISSION
    LOC_MAP_HEIGHT
    LOC_MAP_CUBEMAP
    LOC_MAP_IRRADIANCE
    LOC_MAP_PREFILTER
    LOC_MAP_BRDF

const
  LOC_MAP_DIFFUSE*  = ShaderLocationIndex.LOC_MAP_ALBEDO
  LOC_MAP_SPECULAR* = ShaderLocationIndex.LOC_MAP_METALNESS

type
  TexmapIndex* {.importc, raylib.} = enum
    ## Material map type
    MAP_ALBEDO    = 0       ## MAP_DIFFUSE
    MAP_METALNESS = 1       ## MAP_SPECULAR
    MAP_NORMAL    = 2
    MAP_ROUGHNESS = 3
    MAP_OCCLUSION
    MAP_EMISSION
    MAP_HEIGHT
    MAP_CUBEMAP             ## NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_IRRADIANCE          ## NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_PREFILTER           ## NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_BRDF

const
  MAP_DIFFUSE*  = TexmapIndex.MAP_ALBEDO
  MAP_SPECULAR* = TexmapIndex.MAP_METALNESS

type
  PixelFormat* {.importc, raylib.} = enum
    ## Pixel formats
    ## NOTE: Support depends on OpenGL version and platform
    UNCOMPRESSED_GRAYSCALE = 1   ## 8 bit per pixel (no alpha)
    UNCOMPRESSED_GRAY_ALPHA      ## 8*2 bpp (2 channels)
    UNCOMPRESSED_R5G6B5          ## 16 bpp
    UNCOMPRESSED_R8G8B8          ## 24 bpp
    UNCOMPRESSED_R5G5B5A1        ## 16 bpp (1 bit alpha)
    UNCOMPRESSED_R4G4B4A4        ## 16 bpp (4 bit alpha)
    UNCOMPRESSED_R8G8B8A8        ## 32 bpp
    UNCOMPRESSED_R32             ## 32 bpp (1 channel - cfloat)
    UNCOMPRESSED_R32G32B32       ## 32*3 bpp (3 channels - cfloat)
    UNCOMPRESSED_R32G32B32A32    ## 32*4 bpp (4 channels - cfloat)
    COMPRESSED_DXT1_RGB          ## 4 bpp (no alpha)
    COMPRESSED_DXT1_RGBA         ## 4 bpp (1 bit alpha)
    COMPRESSED_DXT3_RGBA         ## 8 bpp
    COMPRESSED_DXT5_RGBA         ## 8 bpp
    COMPRESSED_ETC1_RGB          ## 4 bpp
    COMPRESSED_ETC2_RGB          ## 4 bpp
    COMPRESSED_ETC2_EAC_RGBA     ## 8 bpp
    COMPRESSED_PVRT_RGB          ## 4 bpp
    COMPRESSED_PVRT_RGBA         ## 4 bpp
    COMPRESSED_ASTC_4x4_RGBA     ## 8 bpp
    COMPRESSED_ASTC_8x8_RGBA     ## 2 bpp

  TextureFilterMode* {.importc, raylib.} = enum
    ## Texture parameters: filter mode
    ## NOTE 1: Filtering considers mipmaps if available in the texture
    ## NOTE 2: Filter is accordingly set for minification and magnification
    FILTER_POINT = 0               ## No filter just pixel aproximation
    FILTER_BILINEAR                ## Linear filtering
    FILTER_TRILINEAR               ## Trilinear filtering (linear with mipmaps)
    FILTER_ANISOTROPIC_4X          ## Anisotropic filtering 4x
    FILTER_ANISOTROPIC_8X          ## Anisotropic filtering 8x
    FILTER_ANISOTROPIC_16X         ## Anisotropic filtering 16x

  TextureWrapMode* {.importc, raylib.} = enum
    ## Texture parameters: wrap mode
    WRAP_REPEAT = 0
    WRAP_CLAMP
    WRAP_MIRROR

  BlendMode* {.importc, raylib.} = enum
    ## Color blending modes (pre-defined)
    BLEND_ALPHA = 0
    BLEND_ADDITIVE
    BLEND_MULTIPLIED

  Gestures* {.importc, raylib.} = enum
    ## Gestures type
    ## NOTE: It could be used as flags to enable only some gestures
    GESTURE_NONE        = 0
    GESTURE_TAP         = 1
    GESTURE_DOUBLETAP   = 2
    GESTURE_HOLD        = 4
    GESTURE_DRAG        = 8
    GESTURE_SWIPE_RIGHT = 16
    GESTURE_SWIPE_LEFT  = 32
    GESTURE_SWIPE_UP    = 64
    GESTURE_SWIPE_DOWN  = 128
    GESTURE_PINCH_IN    = 256
    GESTURE_PINCH_OUT   = 512

  CameraMode* {.importc, raylib.} = enum
    ## Camera system modes
    CAMERA_CUSTOM = 0
    CAMERA_FREE
    CAMERA_ORBITAL
    CAMERA_FIRST_PERSON
    CAMERA_THIRD_PERSON

  CameraType* {.importc, raylib.} = enum
    ## Camera projection modes
    CAMERA_PERSPECTIVE = 0
    CAMERA_ORTHOGRAPHIC

  VrDeviceType* {.importc, raylib.} = enum
    ## Head Mounted Display devices
    HMD_DEFAULT_DEVICE = 0
    HMD_OCULUS_RIFT_DK2
    HMD_OCULUS_RIFT_CV1
    HMD_OCULUS_GO
    HMD_VALVE_HTC_VIVE
    HMD_SONY_PSVR

#------------------------------------------------------------------------------------
# Global Variables Definition
#------------------------------------------------------------------------------------
# It's lonely here...

#------------------------------------------------------------------------------------
# Window and Graphics Device Functions (Module: core)
#------------------------------------------------------------------------------------

# Window-related functions
proc init_window*(width, height: cint; title: cstring) {.varargs, importc: "InitWindow ", raylib.}                                                                                                  ## Initialize window and OpenGL context
proc close_window*() {.importc: "CloseWindow", raylib.}                                                                                                                                             ## Close window and unload OpenGL context
proc window_ready*(): raybool {.importc: "IsWindowReady", raylib.}                                                                                                                                  ## Check if window has been initialized successfully
proc window_should_close*(): raybool {.importc: "WindowShouldClose", raylib.}                                                                                                                       ## Check if KEY_ESCAPE pressed or Close icon pressed
proc window_minimized*(): raybool {.importc: "IsWindowMinimized", raylib.}                                                                                                                          ## Check if window has been minimized (or lost focus)
proc toggle_fullscreen*() {.importc: "ToggleFullscreen", raylib.}                                                                                                                                   ## Toggle fullscreen mode (only PLATFORM_DESKTOP)
proc set_window_icon*(image: Image) {.importc: "SetWindowIcon", raylib.}                                                                                                                            ## Set icon for window (only PLATFORM_DESKTOP)
proc set_window_title*(title: cstring) {.importc: "SetWindowTitle", raylib.}                                                                                                                        ## Set title for window (only PLATFORM_DESKTOP)
proc set_window_position*(x, y: cint) {.importc: "SetWindowPositioncint", raylib.}                                                                                                                  ## Set window position on screen (only PLATFORM_DESKTOP)
proc set_window_monitor*(monitor: cint) {.importc: "SetWindowMonitor", raylib.}                                                                                                                     ## Set monitor for the current window (fullscreen mode)
proc set_window_min_size*(width, height: cint) {.importc: "SetWindowMinSize", raylib.}                                                                                                              ## Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
proc set_window_size*(width, height: cint) {.importc: "SetWindowSize", raylib.}                                                                                                                     ## Set window dimensions
proc screen_width*(): cint {.importc: "GetScreenWidth", raylib.}                                                                                                                                    ## Get current screen width
proc screen_height*(): cint {.importc: "GetScreenHeight", raylib.}                                                                                                                                  ## Get current screen height

# Cursor-related functions
proc show_cursor*() {.importc: "ShowCursor", raylib.}                                                                                                                                               ## Shows cursor
proc hide_cursor*() {.importc: "HideCursor", raylib.}                                                                                                                                               ## Hides cursor
proc cursor_hidden*(): raybool {.importc: "IsCursorHidden", raylib.}                                                                                                                                ## Check if cursor is not visible
proc enable_cursor*() {.importc: "EnableCursor", raylib.}                                                                                                                                           ## Enables cursor (unlock cursor)
proc disable_cursor*() {.importc: "DisableCursor", raylib.}                                                                                                                                         ## Disables cursor (lock cursor)

# Drawing-related functions
proc clear_background*(color: Color) {.importc: "ClearBackground", raylib.}                                                                                                                         ## Set background color (framebuffer clear color)
proc begin_drawing*() {.importc: "BeginDrawing", raylib.}                                                                                                                                           ## Setup canvas (framebuffer) to start drawing
proc end_drawing*() {.importc: "EndDrawing", raylib.}                                                                                                                                               ## End canvas drawing and swap buffers (double buffering)
proc begin_mode2d*(camera: Camera2D) {.importc: "BeginMode2D", raylib.}                                                                                                                             ## Initialize 2D mode with custom camera (2D)
proc end_mode2d*() {.importc: "EndMode2D", raylib.}                                                                                                                                                 ## Ends 2D mode with custom camera
proc begin_mode3D*(camera: Camera3D) {.importc: "BeginMode3D", raylib.}                                                                                                                             ## Initializes 3D mode with custom camera (3D)
proc end_mode3d*() {.importc: "EndMode3D", raylib.}                                                                                                                                                 ## Ends 3D mode and returns to default 2D orthographic mode
proc begin_texture_mode*(target: RenderTexture2D) {.importc: "BeginTextureMode", raylib.}                                                                                                           ## Initializes render texture for drawing
proc end_texture_mode*() {.importc: "EndTextureMode", raylib.}                                                                                                                                      ## Ends drawing to render texture

# Screen-space-related functions
proc mouse_ray*(mousePosition: Vector2; camera: Camera): Ray {.importc: "GetMouseRay", raylib.}                                                                                                     ## Returns a ray trace from mouse position
proc world_to_screen*(position: Vector3; camera: Camera): Vector2 {.importc: "GetWorldToScreen", raylib.}                                                                                           ## Returns the screen space position for a 3d world space position
proc camera_matrix*(camera: Camera): Matrix {.importc: "GetCameraMatrix", raylib.}                                                                                                                  ## Returns camera transform matrix (view matrix)

# Timming-related functions
proc set_target_fps*(fps: cint) {.importc: "SetTargetFPS", raylib.}                                                                                                                                 ## Set target FPS (maximum)
proc get_fps*(): cint {.importc: "GetFPS", raylib.}                                                                                                                                                 ## Returns current FPS
proc get_frame_time*(): cfloat {.importc: "GetFrameTime", raylib.}                                                                                                                                  ## Returns time in seconds for last frame drawn
proc get_time*(): cdouble {.importc: "GetTime", raylib.}                                                                                                                                            ## Returns elapsed time in seconds since InitWindow()

# Color-related functions
proc color_to_int*(color: Color): cint {.importc: "ColorToInt", raylib.}                                                                                                                            ## Returns hexadecimal value for a Color
proc color_normalize*(color: Color): Vector4 {.importc: "ColorNormalize", raylib.}                                                                                                                  ## Returns color normalized as cfloat [0..1]
proc color_to_hSV*(color: Color): Vector3 {.importc: "ColorToHSV", raylib.}                                                                                                                         ## Returns HSV values for a Color
proc get_color*(hexValue: cint): Color {.importc: "GetColor", raylib.}                                                                                                                              ## Returns a Color struct from hexadecimal value
proc fade*(color: Color; alpha: cfloat): Color {.importc: "Fade", raylib.}                                                                                                                          ## Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

# Misc. functions
proc show_logo*() {.importc: "ShowLogo", raylib.}                                                                                                                                                   ## Activate raylib logo at startup (can be done with flags)
proc set_config_flags*(flags: cuchar) {.importc: "SetConfigFlags", raylib.}                                                                                                                         ## Setup window configuration flags (view FLAGS)
proc set_trace_log*(types: cuchar) {.importc: "SetTraceLog", raylib.}                                                                                                                               ## Enable trace log message types (bit flags based)
proc trace_log*(logType: cint; text: cstring) {.varargs, importc: "TraceLog", raylib.}                                                                                                              ## Show trace log messages (LOG_INFO, LOG_WARNING, LOG_ERROR, LOG_DEBUG)
proc take_screenshot*(fileName: cstring) {.importc: "TakeScreenshot", raylib.}                                                                                                                      ## Takes a screenshot of current screen (saved a .png)
proc get_random_value*(min, max: cint): cint {.importc: "GetRandomValue", raylib.}                                                                                                                  ## Returns a random value between min and max (both included)

# Files management functions
proc is_file_extension*(fileName, ext: cstring): raybool {.importc: "IsFileExtension", raylib.}                                                                                                     ## Check file extension
proc file_extension*(fileName: cstring): cstring {.importc: "GetExtension", raylib.}                                                                                                                ## Get pointer to extension for a filename string
proc file_name*(filePath: cstring): cstring {.importc: "GetFileName", raylib.}                                                                                                                      ## Get pointer to filename for a path string
proc directory_path*(fileName: cstring): cstring {.importc: "GetDirectoryPath", raylib.}                                                                                                            ## Get full path for a given fileName (uses static string)
proc working_directory*(): cstring {.importc: "GetWorkingDirectory", raylib.}                                                                                                                       ## Get current working directory (uses static string)
proc change_directory*(dir: cstring): raybool {.importc: "ChangeDirectory", raylib.}                                                                                                                ## Change working directory, returns true if success
proc file_dropped*(): raybool {.importc: "IsFileDropped", raylib.}                                                                                                                                  ## Check if a file has been dropped into window
proc dropped_files*(count: ptr cint): ptr cstring {.importc: "GetDroppedFiles", raylib.}                                                                                                            ## Get dropped files names
proc clear_dropped_files*() {.importc: "ClearDroppedFiles", raylib.}                                                                                                                                ## Clear dropped files paths buffer

# Persistent storage management
proc storage_save_value*(position, value: cint) {.importc: "StorageSaveValue", raylib.}                                                                                                             ## Save integer value to storage file (to defined position)
proc storage_load_value*(position: cint): cint {.importc: "StorageLoadValue", raylib.}                                                                                                              ## Load integer value from storage file (from defined position)

#------------------------------------------------------------------------------------
# Input Handling Functions (Module: core)
#------------------------------------------------------------------------------------

# Input-related functions: keyboard
proc key_pressed*(key: cint): raybool {.importc: "IsKeyPressed", raylib.}                                                                                                                           ## Detect if a key has been pressed once
proc key_down*(key: cint): raybool {.importc: "IsKeyDown", raylib.}                                                                                                                                 ## Detect if a key is being pressed
proc key_released*(key: cint): raybool {.importc: "IsKeyReleased", raylib.}                                                                                                                         ## Detect if a key has been released once
proc key_up*(key: cint): raybool {.importc: "IsKeyUp", raylib.}                                                                                                                                     ## Detect if a key is NOT being pressed
proc get_key_pressed*(): cint {.importc: "GetKeyPressed", raylib.}                                                                                                                                  ## Get latest key pressed
proc set_exit_key*(key: cint) {.importc: "SetExitKey", raylib.}                                                                                                                                     ## Set a custom key to exit program (default is ESC)

# Input-related functions: gamepads
proc gamepad_available*(gamepad: cint): raybool {.importc: "IsGamepadAvailable", raylib.}                                                                                                           ## Detect if a gamepad is available
proc gamepad_name*(gamepad: cint; name: cstring): raybool {.importc: "IsGamepadName", raylib.}                                                                                                      ## Check gamepad name (if available)
proc get_gamepad_name*(gamepad: cint): cstring {.importc: "GetGamepadName", raylib.}                                                                                                                ## Return gamepad internal name id
proc gamepad_button_pressed*(gamepad, button: cint): raybool {.importc: "IsGamepadButtonPressed", raylib.}                                                                                          ## Detect if a gamepad button has been pressed once
proc gamepad_button_down*(gamepad, button: cint): raybool {.importc: "IsGamepadButtonDown", raylib.}                                                                                                ## Detect if a gamepad button is being pressed
proc gamepad_button_released*(gamepad, button: cint): raybool {.importc: "IsGamepadButtonReleased", raylib.}                                                                                        ## Detect if a gamepad button has been released once
proc gamepad_button_up*(gamepad, button: cint): raybool {.importc: "IsGamepadButtonUp", raylib.}                                                                                                    ## Detect if a gamepad button is NOT being pressed
proc get_gamepad_button_pressed*(): cint {.importc: "GetGamepadButtonPressed", raylib.}                                                                                                             ## Get the last gamepad button pressed
proc get_gamepad_axis_count*(gamepad: cint): cint {.importc: "GetGamepadAxisCount", raylib.}                                                                                                        ## Return gamepad axis count for a gamepad
proc get_gamepad_axis_movement*(gamepad, axis: cint): cfloat {.importc: "GetGamepadAxisMovement", raylib.}                                                                                          ## Return axis movement value for a gamepad axis

# Input-related functions: mouse
proc mouse_button_pressed*(button: cint): raybool {.importc: "IsMouseButtonPressed", raylib.}                                                                                                       ## Detect if a mouse button has been pressed once
proc mouse_button_down*(button: cint): raybool {.importc: "IsMouseButtonDown", raylib.}                                                                                                             ## Detect if a mouse button is being pressed
proc mouse_button_released*(button: cint): raybool {.importc: "IsMouseButtonReleased", raylib.}                                                                                                     ## Detect if a mouse button has been released once
proc mouse_button_up*(button: cint): raybool {.importc: "IsMouseButtonUp", raylib.}                                                                                                                 ## Detect if a mouse button is NOT being pressed
proc mouse_x*(): cint {.importc: "GetMouseX", raylib.}                                                                                                                                              ## Returns mouse position X
proc mouse_y*(): cint {.importc: "GetMouseY", raylib.}                                                                                                                                              ## Returns mouse position Y
proc get_mouse_position*(): Vector2 {.importc: "GetMousePosition", raylib.}                                                                                                                         ## Returns mouse position XY
proc set_mouse_position*(position: Vector2) {.importc: "SetMousePosition", raylib.}                                                                                                                 ## Set mouse position XY
proc set_mouse_scale*(scale: cfloat) {.importc: "SetMouseScale", raylib.}                                                                                                                           ## Set mouse scaling
proc mouse_wheel_move*(): cint {.importc: "GetMouseWheelMove", raylib.}                                                                                                                             ## Returns mouse wheel movement Y

# Input-related functions: touch
proc touch_x*(): cint {.importc: "GetTouchX", raylib.}                                                                                                                                              ## Returns touch position X for touch point 0 (relative to screen size)
proc touch_y*(): cint {.importc: "GetTouchY", raylib.}                                                                                                                                              ## Returns touch position Y for touch point 0 (relative to screen size)
proc touch_position*(index: cint): Vector2 {.importc: "GetTouchPosition", raylib.}                                                                                                                  ## Returns touch position XY for a touch point index (relative to screen size)

#------------------------------------------------------------------------------------
# Gestures and Touch Handling Functions (Module: gestures)
#------------------------------------------------------------------------------------
proc set_gestures_enabled*(gestureFlags: cuint) {.importc: "SetGesturesEnabled", raylib.}                                                                                                           ## Enable a set of gestures using flags
proc gesture_detected*(gesture: cint): raybool {.importc: "IsGestureDetected", raylib.}                                                                                                             ## Check if a gesture have been detected
proc gesture_detected*(): cint {.importc: "GetGestureDetected", raylib.}                                                                                                                            ## Get latest detected gesture
proc touch_points_count*(): cint {.importc: "GetTouchPointsCount", raylib.}                                                                                                                         ## Get touch points count
proc gesture_hold_duration*(): cfloat {.importc: "GetGestureHoldDuration", raylib.}                                                                                                                 ## Get gesture hold time in milliseconds
proc gesture_drag_vector*(): Vector2 {.importc: "GetGestureDragVector", raylib.}                                                                                                                    ## Get gesture drag vector
proc gesture_drag_angle*(): cfloat {.importc: "GetGestureDragAngle", raylib.}                                                                                                                       ## Get gesture drag angle
proc gesture_pinch_vector*(): Vector2 {.importc: "GetGesturePinchVector", raylib.}                                                                                                                  ## Get gesture pinch delta
proc gesture_pinch_angle*(): cfloat {.importc: "GetGesturePinchAngle", raylib.}                                                                                                                     ## Get gesture pinch angle

#------------------------------------------------------------------------------------
# Camera System Functions (Module: camera)
#------------------------------------------------------------------------------------
proc `mode=`*(camera: Camera; mode: cint) {.importc: "SetCameraMode", raylib.}                                                                                                                      ## Set camera mode (multiple camera modes available)
proc update*(camera: ptr Camera) {.importc: "UpdateCamera", raylib.}                                                                                                                                ## Update camera position for selected mode

proc set_camera_pan_control*(panKey: cint) {.importc: "SetCameraPanControl", raylib.}                                                                                                               ## Set camera pan key to combine with mouse movement (free camera)
proc set_camera_alt_control*(altKey: cint) {.importc: "SetCameraAltControl", raylib.}                                                                                                               ## Set camera alt key to combine with mouse movement (free camera)
proc set_camera_smooth_zoom_control*(szKey: cint) {.importc: "SetCameraSmoothZoomControl", raylib.}                                                                                                 ## Set camera smooth zoom key to combine with mouse (free camera)
proc set_camera_move_controls*(frontKey, backKey: cint; rightKey, leftKey: cint; upKey, downKey: cint) {.importc: "SetCameraMoveControls", raylib.}                                                 ## Set camera move controls (1st person and 3rd person cameras)

#------------------------------------------------------------------------------------
# Basic Shapes Drawing Functions (Module: shapes)
#------------------------------------------------------------------------------------

# Basic shapes drawing functions
proc draw_pixel*(posX, posY: cint; color: Color) {.importc: "DrawPixel", raylib.}                                                                                                                   ## Draw a pixel
proc draw_pixel_v*(position: Vector2; color: Color) {.importc: "DrawPixelV", raylib.}                                                                                                               ## Draw a pixel (Vector version)
proc draw_line*(startPosX, startPosY: cint; endPosX, endPosY: cint; color: Color) {.importc: "DrawLine", raylib.}                                                                                   ## Draw a line
proc draw_line_v*(startPos: Vector2; endPos: Vector2; color: Color) {.importc: "DrawLineV", raylib.}                                                                                                ## Draw a line (Vector version)
proc draw_line_ex*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.importc: "DrawLineEx", raylib.}                                                                               ## Draw a line defining thickness
proc draw_line_bezier*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.importc: "DrawLineBezier", raylib.}                                                                       ## Draw a line using cubic-bezier curves in-out
proc draw_circle*(centerX, centerY: cint; radius: cfloat; color: Color) {.importc: "DrawCircle", raylib.}                                                                                           ## Draw a color-filled circle
proc draw_circle_gradient*(centerX, centerY: cint; radius: cfloat; color1: Color; color2: Color) {.importc: "DrawCircleGradient", raylib.}                                                          ## Draw a gradient-filled circle
proc draw_circle_v*(center: Vector2; radius: cfloat; color: Color) {.importc: "DrawCircleV", raylib.}                                                                                               ## Draw a color-filled circle (Vector version)
proc draw_circle_lines*(centerX, centerY: cint; radius: cfloat; color: Color) {.importc: "DrawCircleLines", raylib.}                                                                                ## Draw circle outline
proc draw_rectangle*(posX, posY: cint; width, height: cint; color: Color) {.importc: "DrawRectangle", raylib.}                                                                                      ## Draw a color-filled rectangle
proc draw_rectangle_v*(position: Vector2; size: Vector2; color: Color) {.importc: "DrawRectangleV", raylib.}                                                                                        ## Draw a color-filled rectangle (Vector version)
proc draw_rectangle_rec*(rec: Rectangle; color: Color) {.importc: "DrawRectangleRec", raylib.}                                                                                                      ## Draw a color-filled rectangle
proc draw_rectangle_pro*(rec: Rectangle; origin: Vector2; rotation: cfloat; color: Color) {.importc: "DrawRectanglePro", raylib.}                                                                   ## Draw a color-filled rectangle with pro parameters
proc draw_rectangle_gradient_v*(posX, posY: cint; width, height: cint; color1: Color; color2: Color) {.importc: "DrawRectangleGradientV", raylib.}                                                  ## Draw a vertical-gradient-filled rectangle
proc draw_rectangle_gradient_h*(posX, posY: cint; width, height: cint; color1: Color; color2: Color) {.importc: "DrawRectangleGradientH", raylib.}                                                  ## Draw a horizontal-gradient-filled rectangle
proc draw_rectangle_gradient_ex*(rec: Rectangle; col1: Color; col2: Color; col3: Color; col4: Color) {.importc: "DrawRectangleGradientEx", raylib.}                                                 ## Draw a gradient-filled rectangle with custom vertex colors
proc draw_rectangle_lines*(posX, posY: cint; width, height: cint; color: Color) {.importc: "DrawRectangleLines", raylib.}                                                                           ## Draw rectangle outline
proc draw_rectangle_lines_ex*(rec: Rectangle; lineThick: cint; color: Color) {.importc: "DrawRectangleLinesEx", raylib.}                                                                            ## Draw rectangle outline with extended parameters
proc draw_triangle*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.importc: "DrawTriangle", raylib.}                                                                                        ## Draw a color-filled triangle
proc draw_triangle_lines*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.importc: "DrawTriangleLines", raylib.}                                                                             ## Draw triangle outline
proc draw_poly*(center: Vector2; sides: cint; radius, rotation: cfloat; color: Color) {.importc: "DrawPoly", raylib.}                                                                               ## Draw a regular polygon (Vector version)
proc draw_poly_ex*(points: ptr Vector2; numPoints: cint; color: Color) {.importc: "DrawPolyEx", raylib.}                                                                                            ## Draw a closed polygon defined by points
proc draw_poly_ex_lines*(points: ptr Vector2; numPoints: cint; color: Color) {.importc: "DrawPolyExLines", raylib.}                                                                                 ## Draw polygon lines

# Basic shapes collision detection functions
proc check_collision_recs*(rec1: Rectangle; rec2: Rectangle): raybool {.importc: "CheckCollisionRecs", raylib.}                                                                                     ## Check collision between two rectangles
proc check_collision_circles*(center1: Vector2; radius1: cfloat; center2: Vector2; radius2: cfloat): raybool {.importc: "CheckCollisionCircles", raylib.}                                           ## Check collision between two circles
proc check_collision_circle_rec*(center: Vector2; radius: cfloat; rec: Rectangle): raybool {.importc: "CheckCollisionCircleRec", raylib.}                                                           ## Check collision between circle and rectangle
proc collision_rec*(rec1: Rectangle; rec2: Rectangle): Rectangle {.importc: "GetCollisionRec", raylib.}                                                                                             ## Get collision rectangle for two rectangles collision
proc check_collision_point_rec*(point: Vector2; rec: Rectangle): raybool {.importc: "CheckCollisionPointRec", raylib.}                                                                              ## Check if point is inside rectangle
proc check_collision_point_circle*(point: Vector2; center: Vector2; radius: cfloat): raybool {.importc: "CheckCollisionPointCircle", raylib.}                                                       ## Check if point is inside circle
proc check_collision_point_triangle*(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): raybool {.importc: "CheckCollisionPointTriangle", raylib.}                                             ## Check if point is inside a triangle

#------------------------------------------------------------------------------------
# Texture Loading and Drawing Functions (Module: textures)
#------------------------------------------------------------------------------------

# Image/Texture2D data loading/unloading/saving functions
proc load_image*(fileName: cstring): Image {.importc: "LoadImage", raylib.}                                                                                                                         ## Load image from file into CPU memory (RAM)
proc load_image_ex*(pixels: ptr Color; width, height: cint): Image {.importc: "LoadImageEx", raylib.}                                                                                               ## Load image from Color array data (RGBA - 32bit)
proc load_image_pro*(data: pointer; width, height, format: cint): Image {.importc: "LoadImagePro", raylib.}                                                                                         ## Load image from raw data with parameters
proc load_image_raw*(fileName: cstring; width, height: cint; format, headerSize: cint): Image {.importc: "LoadImageRaw", raylib.}                                                                   ## Load image from RAW file data
proc export_image*(fileName: cstring; image: Image) {.importc: "ExportImage", raylib.}                                                                                                              ## Export image as a PNG file
proc load_texture*(fileName: cstring): Texture2D {.importc: "LoadTexture", raylib.}                                                                                                                 ## Load texture from file into GPU memory (VRAM)
proc load_texture_from_image*(image: Image): Texture2D {.importc: "LoadTextureFromImage", raylib.}                                                                                                  ## Load texture from image data
proc load_render_texture*(width, height: cint): RenderTexture2D {.importc: "LoadRenderTexture", raylib.}                                                                                            ## Load texture for rendering (framebuffer)
proc unload*(image: Image) {.importc: "UnloadImage", raylib.}                                                                                                                                       ## Unload image from CPU memory (RAM)
proc unload*(texture: Texture2D) {.importc: "UnloadTexture", raylib.}                                                                                                                               ## Unload texture from GPU memory (VRAM)
proc unload*(target: RenderTexture2D) {.importc: "UnloadRenderTexture", raylib.}                                                                                                                    ## Unload render texture from GPU memory (VRAM)
proc image_data*(image: Image): ptr Color {.importc: "GetImageData", raylib.}                                                                                                                       ## Get pixel data from image as a Color struct array
proc image_data_normalized*(image: Image): ptr Vector4 {.importc: "GetImageDataNormalized", raylib.}                                                                                                ## Get pixel data from image as Vector4 array (cfloat normalized)
proc pixel_data_size*(width, height, format: cint): cint {.importc: "GetPixelDataSize", raylib.}                                                                                                    ## Get pixel data size in bytes (image or texture)
proc texture_data*(texture: Texture2D): Image {.importc: "GetTextureData", raylib.}                                                                                                                 ## Get pixel data from GPU texture and return an Image
proc update_texture*(texture: Texture2D; pixels: pointer) {.importc: "UpdateTexture", raylib.}                                                                                                      ## Update GPU texture with new data

# Image manipulation functions
proc image_copy*(image: Image): Image {.importc: "ImageCopy", raylib.}                                                                                                                              ## Create an image duplicate (useful for transformations)
proc image_to_pOT*(image: ptr Image; fillColor: Color) {.importc: "ImageToPOT", raylib.}                                                                                                            ## Convert image to POT (power-of-two)
proc image_format*(image: ptr Image; newFormat: cint) {.importc: "ImageFormat", raylib.}                                                                                                            ## Convert image data to desired format
proc image_alpha_mask*(image: ptr Image; alphaMask: Image) {.importc: "ImageAlphaMask", raylib.}                                                                                                    ## Apply alpha mask to image
proc image_alpha_clear*(image: ptr Image; color: Color; threshold: cfloat) {.importc: "ImageAlphaClear", raylib.}                                                                                   ## Clear alpha channel to desired color
proc image_alpha_crop*(image: ptr Image; threshold: cfloat) {.importc: "ImageAlphaCrop", raylib.}                                                                                                   ## Crop image depending on alpha value
proc image_alpha_premultiply*(image: ptr Image) {.importc: "ImageAlphaPremultiply", raylib.}                                                                                                        ## Premultiply alpha channel
proc image_crop*(image: ptr Image; crop: Rectangle) {.importc: "ImageCrop", raylib.}                                                                                                                ## Crop an image to a defined rectangle
proc image_resize*(image: ptr Image; newWidth, newHeight: cint) {.importc: "ImageResize", raylib.}                                                                                                  ## Resize image (bilinear filtering)
proc image_resize_nN*(image: ptr Image; newWidth: cint;newHeight: cint) {.importc: "ImageResizeNN", raylib.}                                                                                        ## Resize image (Nearest-Neighbor scaling algorithm)
proc image_resize_canvas*(image: ptr Image; newWidth, newHeight: cint; offsetX, offsetY: cint; color: Color) {.importc: "ImageResizeCanvas", raylib.}                                               ## Resize canvas and fill with color
proc image_mipmaps*(image: ptr Image) {.importc: "ImageMipmaps", raylib.}                                                                                                                           ## Generate all mipmap levels for a provided image
proc image_dither*(image: ptr Image; rBpp, gBpp: cint; bBpp, aBpp: cint) {.importc: "ImageDither", raylib.}                                                                                         ## Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
proc image_text*(text: cstring; fontSize: cint; color: Color): Image {.importc: "ImageText", raylib.}                                                                                               ## Create an image from text (default font)
proc image_text_ex*(font: Font; text: cstring; fontSize, spacing: cfloat; tint: Color): Image {.importc: "ImageTextEx", raylib.}                                                                    ## Create an image from text (custom sprite font)
proc image_draw*(dst: ptr Image; src: Image; srcRec: Rectangle; dstRec: Rectangle) {.importc: "ImageDraw", raylib.}                                                                                 ## Draw a source image within a destination image
proc image_draw_rectangle*(dst: ptr Image; position: Vector2; rec: Rectangle; color: Color) {.importc: "ImageDrawRectangle", raylib.}                                                               ## Draw rectangle within an image
proc image_draw_text*(dst: ptr Image; position: Vector2; text: cstring; fontSize: cint; color: Color) {.importc: "ImageDrawText", raylib.}                                                          ## Draw text (default font) within an image (destination)
proc image_draw_text_ex*(dst: ptr Image; position: Vector2; font: Font; text: cstring; fontSize, spacing: cfloat; color: Color) {.importc: "ImageDrawTextEx", raylib.}                              ## Draw text (custom sprite font) within an image (destination)
proc image_flip_vertical*(image: ptr Image) {.importc: "ImageFlipVertical", raylib.}                                                                                                                ## Flip image vertically
proc image_flip_horizontal*(image: ptr Image) {.importc: "ImageFlipHorizontal", raylib.}                                                                                                            ## Flip image horizontally
proc image_rotate_cW*(image: ptr Image) {.importc: "ImageRotateCW", raylib.}                                                                                                                        ## Rotate image clockwise 90deg
proc image_rotate_cCW*(image: ptr Image) {.importc: "ImageRotateCCW", raylib.}                                                                                                                      ## Rotate image counter-clockwise 90deg
proc image_color_tint*(image: ptr Image; color: Color) {.importc: "ImageColorTint", raylib.}                                                                                                        ## Modify image color: tint
proc image_color_invert*(image: ptr Image) {.importc: "ImageColorInvert", raylib.}                                                                                                                  ## Modify image color: invert
proc image_color_grayscale*(image: ptr Image) {.importc: "ImageColorGrayscale", raylib.}                                                                                                            ## Modify image color: grayscale
proc image_color_contrast*(image: ptr Image; contrast: cfloat) {.importc: "ImageColorContrast", raylib.}                                                                                            ## Modify image color: contrast (-100 to 100)
proc image_color_brightness*(image: ptr Image; brightness: cint) {.importc: "ImageColorBrightness", raylib.}                                                                                        ## Modify image color: brightness (-255 to 255)
proc image_color_replace*(image: ptr Image; color: Color; replace: Color) {.importc: "ImageColorReplace", raylib.}                                                                                  ## Modify image color: replace color

# Image generation functions
proc gen_image_color*(width, height: cint; color: Color): Image {.importc: "GenImageColor", raylib.}                                                                                                ## Generate image: plain color
proc gen_image_gradient_v*(width, height: cint; top: Color; bottom: Color): Image {.importc: "GenImageGradientV", raylib.}                                                                          ## Generate image: vertical gradient
proc gen_image_gradient_h*(width, height: cint; left: Color; right: Color): Image {.importc: "GenImageGradientH", raylib.}                                                                          ## Generate image: horizontal gradient
proc gen_image_gradient_radial*(width, height: cint; density: cfloat; inner: Color; outer: Color): Image {.importc: "GenImageGradientRadial", raylib.}                                              ## Generate image: radial gradient
proc gen_image_checked*(width, height: cint; checksX, checksY: cint; col1: Color; col2: Color): Image {.importc: "GenImageChecked", raylib.}                                                        ## Generate image: checked
proc gen_image_white_noise*(width, height: cint; factor: cfloat): Image {.importc: "GenImageWhiteNoise", raylib.}                                                                                   ## Generate image: white noise
proc gen_image_perlin_noise*(width, height: cint; offsetX, offsetY: cint; scale: cfloat): Image {.importc: "GenImagePerlinNoise", raylib.}                                                          ## Generate image: perlin noise
proc gen_image_cellular*(width, height, tileSize: cint): Image {.importc: "GenImageCellular", raylib.}                                                                                              ## Generate image: cellular algorithm. Bigger tileSize means bigger cells

# Texture2D configuration functions
proc gen_texture_mipmaps*(texture: ptr Texture2D) {.importc: "GenTextureMipmaps", raylib.}                                                                                                          ## Generate GPU mipmaps for a texture
proc `texture_filter=`*(texture: Texture2D; filterMode: cint) {.importc: "SetTextureFilter", raylib.}                                                                                               ## Set texture scaling filter mode
proc `texture_wrap=`*(texture: Texture2D; wrapMode: cint) {.importc: "SetTextureWrap", raylib.}                                                                                                     ## Set texture wrapping mode

# Texture2D drawing functions
proc draw_texture*(texture: Texture2D; posX, posY: cint; tint: Color) {.importc: "DrawTexture", raylib.}                                                                                            ## Draw a Texture2D
proc draw_texture_v*(texture: Texture2D; position: Vector2; tint: Color) {.importc: "DrawTextureV", raylib.}                                                                                        ## Draw a Texture2D with position defined as Vector2
proc draw_texture_ex*(texture: Texture2D; position: Vector2; rotation, scale: cfloat; tint: Color) {.importc: "DrawTextureEx", raylib.}                                                             ## Draw a Texture2D with extended parameters
proc draw_texture_rec*(texture: Texture2D; sourceRec: Rectangle; position: Vector2; tint: Color) {.importc: "DrawTextureRec", raylib.}                                                              ## Draw a part of a texture defined by a rectangle
proc draw_texture_pro*(texture: Texture2D; sourceRec: Rectangle; destRec: Rectangle; origin: Vector2; rotation: cfloat; tint: Color) {.importc: "DrawTexturePro", raylib.}                          ## Draw a part of a texture defined by a rectangle with 'pro' parameters

#------------------------------------------------------------------------------------
# Font Loading and Text Drawing Functions (Module: text)
#------------------------------------------------------------------------------------

# Font loading/unloading functions
proc font_default*(): Font {.importc: "GetFontDefault", raylib.}                                                                                                                                    ## Get the default Font
proc load_font*(fileName: cstring): Font {.importc: "LoadFont", raylib.}                                                                                                                            ## Load font from file into GPU memory (VRAM)
proc load_font_ex*(fileName: cstring; fontSize, charsCount: cint; fontChars: ptr cint): Font {.importc: "LoadFontEx", raylib.}                                                                      ## Load font from file with extended parameters
proc load_font_data*(fileName: cstring; fontSize: cint; fontChars: ptr cint; charsCount: cint; sdf: raybool): ptr CharInfo {.importc: "LoadFontData", raylib.}                                      ## Load font data for further use
proc gen_image_font_atlas*(chars: ptr CharInfo; fontSize, charsCount, padding, packMethod: cint): Image {.importc: "GenImageFontAtlas", raylib.}                                                    ## Generate image font atlas using chars info
proc unload*(font: Font) {.importc: "UnloadFont", raylib.}                                                                                                                                          ## Unload Font from GPU memory (VRAM)

# Text drawing functions
proc draw_fps*(posX, posY: cint) {.importc: "DrawFPS", raylib.}                                                                                                                                     ## Shows current FPS
proc draw_text*(text: cstring; posX, posY, fontSize: cint; color: Color) {.importc: "DrawText", raylib.}                                                                                            ## Draw text (using default font)
proc draw_text_ex*(font: Font; text: cstring; position: Vector2; fontSize, spacing: cfloat; tint: Color) {.importc: "DrawTextEx", raylib.}                                                          ## Draw text using font and additional parameters

# Text misc. functions
proc measure_text*(text: cstring; fontSize: cint): cint {.importc: "MeasureText", raylib.}                                                                                                          ## Measure string width for default font
proc measure_text_ex*(font: Font; text: cstring; fontSize, spacing: cfloat): Vector2 {.importc: "MeasureTextEx", raylib.}                                                                           ## Measure string size for Font
proc format_text*(text: cstring): cstring {.varargs, importc: "FormatText", raylib.}                                                                                                                ## Formatting of text with variables to 'embed'
proc sub_text*(text: cstring; position, length: cint): cstring {.importc: "SubText", raylib.}                                                                                                       ## Get a piece of a text string
proc get_glyph_index*(font: Font; character: cint): cint {.importc: "GetGlyphIndex", raylib.}                                                                                                       ## Get index position for a unicode character on font

#------------------------------------------------------------------------------------
# Basic 3d Shapes Drawing Functions (Module: models)
#------------------------------------------------------------------------------------

# Basic geometric 3D shapes drawing functions
proc draw_line3D*(startPos: Vector3; endPos: Vector3; color: Color) {.importc: "DrawLine3D", raylib.}                                                                                               ## Draw a line in 3D world space
proc draw_circle3D*(center: Vector3; radius: cfloat; rotationAxis: Vector3; rotationAngle: cfloat; color: Color) {.importc: "DrawCircle3D", raylib.}                                                ## Draw a circle in 3D world space
proc draw_cube*(position: Vector3; width, height, length: cfloat; color: Color) {.importc: "DrawCube", raylib.}                                                                                     ## Draw cube
proc draw_cube_v*(position: Vector3; size: Vector3; color: Color) {.importc: "DrawCubeV", raylib.}                                                                                                  ## Draw cube (Vector version)
proc draw_cube_wires*(position: Vector3; width, height, length: cfloat; color: Color) {.importc: "DrawCubeWires", raylib.}                                                                          ## Draw cube wires
proc draw_cube_texture*(texture: Texture2D; position: Vector3; width, height, length: cfloat; color: Color) {.importc: "DrawCubeTexture", raylib.}                                                  ## Draw cube textured
proc draw_sphere*(centerPos: Vector3; radius: cfloat; color: Color) {.importc: "DrawSphere", raylib.}                                                                                               ## Draw sphere
proc draw_sphere_ex*(centerPos: Vector3; radius: cfloat; rings, slices: cint; color: Color) {.importc: "DrawSphereEx", raylib.}                                                                     ## Draw sphere with extended parameters
proc draw_sphere_wires*(centerPos: Vector3; radius: cfloat; rings, slices: cint; color: Color) {.importc: "DrawSphereWires", raylib.}                                                               ## Draw sphere wires
proc draw_cylinder*(position: Vector3; radiusTop, radiusBottom, height: cfloat; slices: cint; color: Color) {.importc: "DrawCylinder", raylib.}                                                     ## Draw a cylinder/cone
proc draw_cylinder_wires*(position: Vector3; radiusTop, radiusBottom, height: cfloat; slices: cint; color: Color) {.importc: "DrawCylinderWires", raylib.}                                          ## Draw a cylinder/cone wires
proc draw_plane*(centerPos: Vector3; size: Vector2; color: Color) {.importc: "DrawPlane", raylib.}                                                                                                  ## Draw a plane XZ
proc draw_ray*(ray: Ray; color: Color) {.importc: "DrawRay", raylib.}                                                                                                                               ## Draw a ray line
proc draw_grid*(slices: cint; spacing: cfloat) {.importc: "DrawGrid", raylib.}                                                                                                                      ## Draw a grid (centered at (0, 0, 0))
proc draw_gizmo*(position: Vector3) {.importc: "DrawGizmo", raylib.}                                                                                                                                ## Draw simple gizmo

#------------------------------------------------------------------------------------
# Model 3d Loading and Drawing Functions (Module: models)
#------------------------------------------------------------------------------------

# Model loading/unloading functions
proc load_model*(fileName: cstring): Model {.importc: "LoadModel", raylib.}                                                                                                                         ## Load model from files (mesh and material)
proc load_model_from_mesh*(mesh: Mesh): Model {.importc: "LoadModelFromMesh", raylib.}                                                                                                              ## Load model from generated mesh
proc unload*(model: Model) {.importc: "UnloadModel", raylib.}                                                                                                                                       ## Unload model from memory (RAM and/or VRAM)

# Mesh loading/unloading functions
proc load_mesh*(fileName: cstring): Mesh {.importc: "LoadMesh", raylib.}                                                                                                                            ## Load mesh from file
proc unload*(mesh: ptr Mesh) {.importc: "UnloadMesh", raylib.}                                                                                                                                      ## Unload mesh from memory (RAM and/or VRAM)
proc export_mesh*(fileName: cstring; mesh: Mesh) {.importc: "ExportMesh", raylib.}                                                                                                                  ## Export mesh as an OBJ file

# Mesh manipulation functions
proc bounding_box*(mesh: Mesh): BoundingBox {.importc: "MeshBoundingBox", raylib.}                                                                                                                  ## Compute mesh bounding box limits
proc tangents*(mesh: ptr Mesh) {.importc: "MeshTangents", raylib.}                                                                                                                                  ## Compute mesh tangents
proc binormals*(mesh: ptr Mesh) {.importc: "MeshBinormals", raylib.}                                                                                                                                ## Compute mesh binormals

# Mesh generation functions
proc gen_mesh_plane*(width, length: cfloat; resX, resZ: cint): Mesh {.importc: "GenMeshPlane", raylib.}                                                                                             ## Generate plane mesh (with subdivisions)
proc gen_mesh_cube*(width, height, length: cfloat): Mesh {.importc: "GenMeshCube", raylib.}                                                                                                         ## Generate cuboid mesh
proc gen_mesh_sphere*(radius: cfloat; rings, slices: cint): Mesh {.importc: "GenMeshSphere", raylib.}                                                                                               ## Generate sphere mesh (standard sphere)
proc gen_mesh_hemi_sphere*(radius: cfloat; rings, slices: cint): Mesh {.importc: "GenMeshHemiSphere", raylib.}                                                                                      ## Generate half-sphere mesh (no bottom cap)
proc gen_mesh_cylinder*(radius, height: cfloat; slices: cint): Mesh {.importc: "GenMeshCylinder", raylib.}                                                                                          ## Generate cylinder mesh
proc gen_mesh_torus*(radius, size: cfloat; radSeg, sides: cint): Mesh {.importc: "GenMeshTorus", raylib.}                                                                                           ## Generate torus mesh
proc gen_mesh_knot*(radius, size: cfloat; radSeg, sides: cint): Mesh {.importc: "GenMeshKnot", raylib.}                                                                                             ## Generate trefoil knot mesh
proc gen_mesh_heightmap*(heightmap: Image; size: Vector3): Mesh {.importc: "GenMeshHeightmap", raylib.}                                                                                             ## Generate heightmap mesh from image data
proc gen_mesh_cubicmap*(cubicmap: Image; cubeSize: Vector3): Mesh {.importc: "GenMeshCubicmap", raylib.}                                                                                            ## Generate cubes-based map mesh from image data

# Material loading/unloading functions
proc load_material*(fileName: cstring): Material {.importc: "LoadMaterial", raylib.}                                                                                                                ## Load material from file
proc load_material_default*(): Material {.importc: "LoadMaterialDefault", raylib.}                                                                                                                  ## Load default material (Supports: DIFFUSE; SPECULAR, NORMAL maps)
proc unload*(material: Material) {.importc: "UnloadMaterial", raylib.}                                                                                                                              ## Unload material from GPU memory (VRAM)

# Model drawing functions
proc draw_model*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.importc: "DrawModel", raylib.}                                                                                      ## Draw a model (with texture if set)
proc draw_model_ex*(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: cfloat; scale: Vector3; tint: Color) {.importc: "DrawModelEx", raylib.}                                  ## Draw a model with extended parameters
proc draw_model_wires*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.importc: "DrawModelWires", raylib.}                                                                           ## Draw a model wires (with texture if set)
proc draw_model_wires_ex*(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: cfloat; scale: Vector3; tint: Color) {.importc: "DrawModelWiresEx", raylib.}                       ## Draw a model wires (with texture if set) with extended parameters
proc draw_bounding_box*(box: BoundingBox; color: Color) {.importc: "DrawBoundingBox", raylib.}                                                                                                      ## Draw bounding box (wires)
proc draw_billboard*(camera: Camera; texture: Texture2D; center: Vector3; size: cfloat; tint: Color) {.importc: "DrawBillboard", raylib.}                                                           ## Draw a billboard texture
proc draw_billboard_rec*(camera: Camera; texture: Texture2D; sourceRec: Rectangle; center: Vector3; size: cfloat; tint: Color) {.importc: "DrawBillboardRec", raylib.}                              ## Draw a billboard texture defined by sourceRec

# Collision detection functions
proc check_collision_spheres*(centerA: Vector3; radiusA: cfloat; centerB: Vector3; radiusB: cfloat): raybool {.importc: "CheckCollisionSpheres", raylib.}                                           ## Detect collision between two spheres
proc check_collision_boxes*(box1: BoundingBox; box2: BoundingBox): raybool {.importc: "CheckCollisionBoxes", raylib.}                                                                               ## Detect collision between two bounding boxes
proc check_collision_box_sphere*(box: BoundingBox; centerSphere: Vector3; radiusSphere: cfloat): raybool {.importc: "CheckCollisionBoxSphere", raylib.}                                             ## Detect collision between box and sphere
proc check_collision_ray_sphere*(ray: Ray; spherePosition: Vector3; sphereRadius: cfloat): raybool {.importc: "CheckCollisionRaySphere", raylib.}                                                   ## Detect collision between ray and sphere
proc check_collision_ray_sphere_ex*(ray: Ray; spherePosition: Vector3; sphereRadius: cfloat; collisionPoint: ptr Vector3): raybool {.importc: "CheckCollisionRaySphereEx", raylib.}                 ## Detect collision between ray and sphere, returns collision point
proc check_collision_ray_box*(ray: Ray; box: BoundingBox): raybool {.importc: "CheckCollisionRayBox", raylib.}                                                                                      ## Detect collision between ray and box
proc collision_ray_model*(ray: Ray; model: ptr Model): RayHitInfo {.importc: "GetCollisionRayModel", raylib.}                                                                                       ## Get collision info between ray and model
proc collision_ray_triangle*(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayHitInfo {.importc: "GetCollisionRayTriangle", raylib.}                                                            ## Get collision info between ray and triangle
proc collision_ray_ground*(ray: Ray; groundHeight: cfloat): RayHitInfo {.importc: "GetCollisionRayGround", raylib.}                                                                                 ## Get collision info between ray and ground plane (Y-normal plane)

#------------------------------------------------------------------------------------
# Shaders System Functions (Module: rlgl)
# NOTE: This functions are useless when using OpenGL 1.1
#------------------------------------------------------------------------------------

# Shader loading/unloading functions
proc load_text*(fileName: cstring): cstring {.importc: "LoadText", raylib.}                                                                                                                         ## Load chars array from text file
proc load_shader*(vsFileName, fsFileName: cstring): Shader {.importc: "LoadShader", raylib.}                                                                                                        ## Load shader from files and bind default locations
proc load_shader_code*(vsCode, fsCode: cstring): Shader {.importc: "LoadShaderCode", raylib.}                                                                                                       ## Load shader from code strings and bind default locations
proc unload*(shader: Shader) {.importc: "UnloadShader", raylib.}                                                                                                                                    ## Unload shader from GPU memory (VRAM)

proc shader_default*(): Shader {.importc: "GetShaderDefault", raylib.}                                                                                                                              ## Get default shader
proc texture_default*(): Texture2D {.importc: "GetTextureDefault", raylib.}                                                                                                                         ## Get default texture

# Shader configuration functions
proc shader_location*(shader: Shader; uniformName: cstring): cint {.importc: "GetShaderLocation", raylib.}                                                                                          ## Get shader uniform location
proc set_shader_value*(shader: Shader; uniformLoc: cint; value: ptr cfloat; size: cint) {.importc: "SetShaderValue", raylib.}                                                                       ## Set shader uniform value (cfloat)
proc set_shader_valuei*(shader: Shader; cintcintuniformLoc, value: ptr cint; size: cint) {.importc: "SetShaderValuei", raylib.}                                                                     ## Set shader uniform value (cint)
proc set_shader_value_matrix*(shader: Shader; uniformLoc: cint; mat: Matrix) {.importc: "SetShaderValueMatrix", raylib.}                                                                            ## Set shader uniform value (matrix 4x4)
proc set_matrix_projection*(proj: Matrix) {.importc: "SetMatrixProjection", raylib.}                                                                                                                ## Set a custom projection matrix (replaces internal projection matrix)
proc set_matrix_modelview*(view: Matrix) {.importc: "SetMatrixModelview", raylib.}                                                                                                                  ## Set a custom modelview matrix (replaces internal modelview matrix)
proc matrix_modelview*(): Matrix {.importc: "GetMatrixModelview", raylib.}                                                                                                                          ## Get internal modelview matrix

# Texture maps generation (PBR)
# NOTE: Required shaders should be provided
proc gen_texture_cubemap*(shader: Shader; skyHDR: Texture2D; size: cint): Texture2D {.importc: "GenTextureCubemap", raylib.}                                                                        ## Generate cubemap texture from HDR texture
proc gen_texture_irradiance*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.importc: "GenTextureIrradiance", raylib.}                                                                 ## Generate irradiance texture using cubemap data
proc gen_texture_prefilter*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.importc: "GenTexturePrefilter", raylib.}                                                                   ## Generate prefilter texture using cubemap data
proc gen_texture_bRDF*(shader: Shader; cubemap: Texture2D; size: cint): Texture2D {.importc: "GenTextureBRDF", raylib.}                                                                             ## Generate BRDF texture using cubemap data

# Shading begin/end functions
proc begin_shader_mode*(shader: Shader) {.importc: "BeginShaderMode", raylib.}                                                                                                                      ## Begin custom shader drawing
proc end_shader_mode*() {.importc: "EndShaderMode", raylib.}                                                                                                                                        ## End custom shader drawing (use default shader)
proc begin_blend_mode*(mode: cint) {.importc: "BeginBlendMode", raylib.}                                                                                                                            ## Begin blending mode (alpha, additive, multiplied)
proc end_blend_mode*() {.importc: "EndBlendMode", raylib.}                                                                                                                                          ## End blending mode (reset to default: alpha blending)

# VR control functions
proc get_vr_device_info*(vrDeviceType: cint): VrDeviceInfo {.importc: "GetVrDeviceInfo", raylib.}                                                                                                   ## Get VR device information for some standard devices
proc init_vr_simulator*(info: VrDeviceInfo) {.importc: "InitVrSimulator", raylib.}                                                                                                                  ## Init VR simulator for selected device parameters
proc close_vr_simulator*() {.importc: "CloseVrSimulator", raylib.}                                                                                                                                  ## Close VR simulator for current device
proc is_vr_simulator_ready*(): raybool {.importc: "IsVrSimulatorReady", raylib.}                                                                                                                    ## Detect if VR simulator is ready
proc set_vr_distortion_shader*(shader: Shader) {.importc: "SetVrDistortionShader", raylib.}                                                                                                         ## Set VR distortion shader for stereoscopic rendering
proc update_vr_tracking*(camera: ptr Camera) {.importc: "UpdateVrTracking", raylib.}                                                                                                                ## Update VR tracking (position and orientation) and camera
proc toggle_vr_mode*() {.importc: "ToggleVrMode", raylib.}                                                                                                                                          ## Enable/Disable VR experience
proc begin_vr_drawing*() {.importc: "BeginVrDrawing", raylib.}                                                                                                                                      ## Begin VR simulator stereo rendering
proc end_vr_drawing*() {.importc: "EndVrDrawing", raylib.}                                                                                                                                          ## End VR simulator stereo rendering

#------------------------------------------------------------------------------------
# Audio Loading and Playing Functions (Module: audio)
#------------------------------------------------------------------------------------

# Audio device management functions
proc init_audio_device*() {.importc: "InitAudioDevice", raylib.}                                                                                                                                    ## Initialize audio device and context
proc close_audio_device*() {.importc: "CloseAudioDevice", raylib.}                                                                                                                                  ## Close the audio device and context
proc audio_device_ready*(): raybool {.importc: "IsAudioDeviceReady", raylib.}                                                                                                                       ## Check if audio device has been initialized successfully
proc set_master_volume*(volume: cfloat) {.importc: "SetMasterVolume", raylib.}                                                                                                                      ## Set master volume (listener)

# Wave/Sound loading/unloading functions
proc load_wave*(fileName: cstring): Wave {.importc: "LoadWave", raylib.}                                                                                                                            ## Load wave data from file
proc load_wave_ex*(data: pointer; sampleCount, sampleRate: cint; sampleSize, channels: cint): Wave {.importc: "LoadWaveEx", raylib.}                                                                ## Load wave data from raw array data
proc load_sound*(fileName: cstring): Sound {.importc: "LoadSound", raylib.}                                                                                                                         ## Load sound from file
proc load_sound_from_wave*(wave: Wave): Sound {.importc: "LoadSoundFromWave", raylib.}                                                                                                              ## Load sound from wave data
proc update*(sound: Sound; data: pointer; samplesCount: cint) {.importc: "UpdateSound", raylib.}                                                                                                    ## Update sound buffer with new data
proc unload*(wave: Wave) {.importc: "UnloadWave", raylib.}                                                                                                                                          ## Unload wave data
proc unload*(sound: Sound) {.importc: "UnloadSound", raylib.}                                                                                                                                       ## Unload sound

# Wave/Sound management functions
proc play_sound*(sound: Sound) {.importc: "PlaySound", raylib.}                                                                                                                                     ## Play a sound
proc pause*(sound: Sound) {.importc: "PauseSound", raylib.}                                                                                                                                         ## Pause a sound
proc resume*(sound: Sound) {.importc: "ResumeSound", raylib.}                                                                                                                                       ## Resume a paused sound
proc stop*(sound: Sound) {.importc: "StopSound", raylib.}                                                                                                                                           ## Stop playing a sound
proc playing*(sound: Sound): raybool {.importc: "IsSoundPlaying", raylib.}                                                                                                                          ## Check if a sound is currently playing
proc `volume=`*(sound: Sound; volume: cfloat) {.importc: "SetSoundVolume", raylib.}                                                                                                                 ## Set volume for a sound (1.0 is max level)
proc `pitch=`*(sound: Sound; pitch: cfloat) {.importc: "SetSoundPitch", raylib.}                                                                                                                    ## Set pitch for a sound (1.0 is base level)
proc format*(wave: ptr Wave; sampleRate, sampleSize, channels: cint) {.importc: "WaveFormat", raylib.}                                                                                              ## Convert wave data to desired format
proc copy*(wave: Wave): Wave {.importc: "WaveCopy", raylib.}                                                                                                                                        ## Copy a wave to a new wave
proc crop*(wave: ptr Wave; initSample, finalSample: cint) {.importc: "WaveCrop", raylib.}                                                                                                           ## Crop a wave to defined samples range
proc data*(wave: Wave): ptr cfloat {.importc: "GetWaveData", raylib.}                                                                                                                               ## Get samples data from wave as a cfloats array

# Music management functions
proc load_music_stream*(fileName: cstring): Music {.importc: "LoadMusicStream", raylib.}                                                                                                            ## Load music stream from file
proc unload*(music: Music) {.importc: "UnloadMusicStream", raylib.}                                                                                                                                 ## Unload music stream
proc play*(music: Music) {.importc: "PlayMusicStream", raylib.}                                                                                                                                     ## Start music playing
proc update*(music: Music) {.importc: "UpdateMusicStream", raylib.}                                                                                                                                 ## Updates buffers for music streaming
proc stop*(music: Music) {.importc: "StopMusicStream", raylib.}                                                                                                                                     ## Stop music playing
proc pause*(music: Music) {.importc: "PauseMusicStream", raylib.}                                                                                                                                   ## Pause music playing
proc resume*(music: Music) {.importc: "ResumeMusicStream", raylib.}                                                                                                                                 ## Resume playing paused music
proc is_playing*(music: Music): raybool {.importc: "IsMusicPlaying", raylib.}                                                                                                                       ## Check if music is playing
proc `volume=`*(music: Music; volume: cfloat) {.importc: "SetMusicVolume", raylib.}                                                                                                                 ## Set volume for music (1.0 is max level)
proc `pitch=`*(music: Music; pitch: cfloat) {.importc: "SetMusicPitch", raylib.}                                                                                                                    ## Set pitch for a music (1.0 is base level)
proc `loop_count=`*(music: Music; count: cint) {.importc: "SetMusicLoopCount", raylib.}                                                                                                             ## Set music loop count (loop repeats)
proc time_length*(music: Music): cfloat {.importc: "GetMusicTimeLength", raylib.}                                                                                                                   ## Get music time length (in seconds)
proc time_played*(music: Music): cfloat {.importc: "GetMusicTimePlayed", raylib.}                                                                                                                   ## Get current music time played (in seconds)

# AudioStream management functions
proc init_audio_stream*(sampleRate: cuint; sampleSize: cuint; channels: cuint): AudioStream {.importc: "InitAudioStream", raylib.}                                                                  ## Init audio stream (to stream raw audio pcm data)
proc update*(stream: AudioStream; data: pointer; samplesCount: cint) {.importc: "UpdateAudioStream", raylib.}                                                                                       ## Update audio stream buffers with data
proc close*(stream: AudioStream) {.importc: "CloseAudioStream", raylib.}                                                                                                                            ## Close audio stream and free memory
proc audio_buffer_processed*(stream: AudioStream): raybool {.importc: "IsAudioBufferProcessed", raylib.}                                                                                            ## Check if any audio stream buffers requires refill
proc play*(stream: AudioStream) {.importc: "PlayAudioStream", raylib.}                                                                                                                              ## Play audio stream
proc pause*(stream: AudioStream) {.importc: "PauseAudioStream", raylib.}                                                                                                                            ## Pause audio stream
proc resume*(stream: AudioStream) {.importc: "ResumeAudioStream", raylib.}                                                                                                                          ## Resume audio stream
proc playing*(stream: AudioStream): raybool {.importc: "IsAudioStreamPlaying", raylib.}                                                                                                             ## Check if audio stream is playing
proc stop*(stream: AudioStream) {.importc: "StopAudioStream", raylib.}                                                                                                                              ## Stop audio stream
proc `volume=`*(stream: AudioStream; volume: cfloat) {.importc: "SetAudioStreamVolume", raylib.}                                                                                                    ## Set volume for audio stream (1.0 is max level)
proc `pitch=`*(stream: AudioStream; pitch: cfloat) {.importc: "SetAudioStreamPitch", raylib.}                                                                                                       ## Set pitch for audio stream (1.0 is base level)

