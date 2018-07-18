#*******************************************************************************************
#
#   raylib easings (header only file)
#   
#   Useful easing functions for values animation
#
#   This header uses:
#       #define EASINGS_STATIC_INLINE       # Inlines all functions code, so it runs faster.
#                                           # This requires lots of memory on system.
#   How to use:
#   The four inputs t,b,c,d are defined as follows:
#   t = current time (in any unit measure, but same unit as duration)
#   b = starting value to interpolate
#   c = the total change in value of b that needs to occur
#   d = total time it should take to complete (duration)
#
#   Example:
#
#   int currentTime = 0;
#   int duration = 100;
#   float startPositionX = 0.0f;
#   float finalPositionX = 30.0f;
#   float currentPositionX = startPositionX;
#
#   while (currentPositionX < finalPositionX)
#   {
#       currentPositionX = EaseSineIn(currentTime, startPositionX, finalPositionX - startPositionX, duration);
#       currentTime++;
#   }
#
#   A port of Robert Penner's easing equations to C (http:#robertpenner.com/easing/)
#
#   Robert Penner License
#   ---------------------------------------------------------------------------------
#   Open source under the BSD License. 
#
#   Copyright (c) 2001 Robert Penner. All rights reserved.
#
#   Redistribution and use in source and binary forms, with or without modification, 
#   are permitted provided that the following conditions are met:
#
#       - Redistributions of source code must retain the above copyright notice, 
#         this list of conditions and the following disclaimer.
#       - Redistributions in binary form must reproduce the above copyright notice, 
#         this list of conditions and the following disclaimer in the documentation 
#         and/or other materials provided with the distribution.
#       - Neither the name of the author nor the names of contributors may be used 
#         to endorse or promote products derived from this software without specific 
#         prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
#   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
#   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
#   IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
#   INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
#   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
#   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
#   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
#   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
#   OF THE POSSIBILITY OF SUCH DAMAGE.
#   ---------------------------------------------------------------------------------
#
#   Copyright (c) 2015 Ramon Santamaria
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

# You can also use skEasing, which is the same (and more!) but in pure Nim...

{.pragma: easing, header: "<easings.h>".}

# Linear Easing functions
proc ease_linear_none*(t, b, c, d: cfloat): cfloat {.importc: "EaseLinearNone", easing.}
proc ease_linear_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseLinearIn", easing.}
proc ease_linear_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseLinearOut", easing.}
proc ease_linear_in_out*(t,b, c, d: cfloat): cfloat {.importc: "EaseLinearInOut", easing.}

# Sine Easing functions
proc ease_sine_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseSineIn", easing.}
proc ease_sine_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseSineOut", easing.}
proc ease_sine_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseSineInOut", easing.}

# Circular Easing functions
proc ease_circ_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseCircIn", easing.}
proc ease_circ_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseCircOut", easing.}
proc ease_circ_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseCircInOut", easing.}

# Cubic Easing functions
proc ease_cubic_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseCubicIn", easing.}
proc ease_cubic_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseCubicOut", easing.}
proc ease_cubic_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseCubicInOut", easing.}

# Quadratic Easing functions
proc ease_quad_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseQuadIn", easing.}
proc ease_quad_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseQuadOut", easing.}
proc ease_quad_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseQuadInOut", easing.}

# Exponential Easing functions
proc ease_expo_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseExpoIn", easing.}
proc ease_expo_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseExpoOut", easing.}
proc ease_expo_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseExpoInOut", easing.}

# Back Easing functions
proc ease_back_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseBackIn", easing.}
proc ease_back_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseBackOut", easing.}
proc ease_back_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseBackInOut", easing.}

# Bounce Easing functions
proc ease_bounce_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseBounceOut", easing.}
proc ease_bounce_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseBounceIn", easing.}
proc ease_bounce_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseBounceInOut", easing.}

# Elastic Easing functions
proc ease_elastic_in*(t, b, c, d: cfloat): cfloat {.importc: "EaseElasticIn", easing.}
proc ease_elastic_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseElasticOut", easing.}
proc ease_elastic_in_out*(t, b, c, d: cfloat): cfloat {.importc: "EaseElasticInOut", easing.}

