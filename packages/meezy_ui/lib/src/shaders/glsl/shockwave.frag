#ifdef GL_ES
precision mediump float;
#endif

layout(location = 0) out vec4 fragColor;

uniform float iTime;
uniform vec2 iResolution;
uniform vec2 splashPoint;
uniform sampler2D iChannel0;
uniform sampler2D iChannel1;
uniform float circleMixFactor;

// Constants for the wave effect
const float HALF_PI         = 3.14;
const float POW_EXP         = 20.0;
const float SHOCK_STRENGTH  = 0.5;
const float LENSING_SPREAD  = 0.7;

const float MAX_RADIUS = 1.5;

void main() {
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    vec2 origin = splashPoint.xy / iResolution.xy;

    float localTime = fract(iTime);

    float aspect = iResolution.x / iResolution.y;

    vec2 scaledUv     = vec2(uv.x * aspect, uv.y);
    vec2 scaledOrigin = vec2(origin.x * aspect, origin.y);

    float radius = MAX_RADIUS * localTime;

    float circle = radius - distance(scaledOrigin, scaledUv);

    // Main ripple factor
    float factor = SHOCK_STRENGTH
    * sin(localTime * HALF_PI)
    * pow(clamp(1.0 - abs(circle), 0.0, 1.0), POW_EXP);

    // Lensing offset
    vec2 offsetVec = (LENSING_SPREAD * factor) * normalize(origin - uv);

    // Sample both textures
    vec3 color0 = texture(iChannel0, uv + offsetVec).rgb;
    vec3 color1 = texture(iChannel1, uv + offsetVec).rgb;

    // Transition mix factor
    float mixVal = clamp(localTime + circle * circleMixFactor, 0.0, 1.0);

    // Final color
    vec3 color = mix(color0, color1, mixVal);
    fragColor = vec4(color, 1.0);
}