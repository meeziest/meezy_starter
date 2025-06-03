#include <flutter/runtime_effect.glsl>

uniform vec2 u_size;       // The size of the canvas
uniform float u_time;      // Animation time
uniform vec2 u_mouse;      // Mouse/touch position
uniform vec3 u_base_color;

out vec4 frag_color;

void main() {
    float speed = 0.1;
    float scale = 0.002;
    vec2 p = FlutterFragCoord().xy * scale;

    for (int i = 1; i < 10; i++) {
        p.x += 0.3 / float(i) * sin(float(i) * 3.0 * p.y + u_time * speed) + u_mouse.x / 1000.0;
        p.y += 0.3 / float(i) * cos(float(i) * 3.0 * p.x + u_time * speed) + u_mouse.y / 1000.0;
    }

    float r = cos(p.x + p.y + 1.0) * 0.5 + 0.5;
    float g = sin(p.x + p.y + 1.0) * 0.5 + 0.5;
    float b = (sin(p.x + p.y) + cos(p.x + p.y)) * 0.3 + 0.5;

    // Blend the calculated color with the uniform base color
    vec3 dynamic_color = vec3(r, g, b) * u_base_color;

    frag_color = vec4(dynamic_color, 1.0);
}