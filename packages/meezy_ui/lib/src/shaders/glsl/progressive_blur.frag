#version 460 core
#include <flutter/runtime_effect.glsl>

#define MAX_KERNEL_SIZE 255

uniform sampler2D child_texture;
uniform vec2 child_size;

uniform sampler2D blur_texture;
uniform float blur_sigma;
uniform float blur_direction; // 0 for horizontal, 1 for vertical

out vec4 frag_color;

void main() {
  vec2 uv = FlutterFragCoord().xy / child_size;
  
  // Squaring the blur texture value makes it look more consistent?
  float sigma = blur_sigma * (pow(texture(blur_texture, uv).r, 2));
  vec2 dir = blur_direction == 0.0? vec2(1.0, 0.0) : vec2(0.0, 1.0);

  if (sigma < 1e-5) {
    frag_color = texture(child_texture, uv);
    return;
  }

  int kernel_radius = int(ceil(3.0 * sigma));
  int kernel_size = 2 * kernel_radius + 1;
  if (kernel_size > MAX_KERNEL_SIZE) {
    kernel_radius = MAX_KERNEL_SIZE / 2;
    kernel_size = MAX_KERNEL_SIZE;
  }

  float total_weight = 0.0;

  vec4 color = vec4(0);
  for (int i = 0; i < MAX_KERNEL_SIZE; i++) {
    if (i >= kernel_size) break;

    int v = i - kernel_radius;
    float weight = exp(-float(v * v) / (2.0 * sigma * sigma));
    total_weight += weight;

    vec2 offset = vec2(float(v)) / child_size;
    offset *= dir;

    color += texture(child_texture, uv + offset) * weight;
  }
  
  frag_color = color / total_weight;
}