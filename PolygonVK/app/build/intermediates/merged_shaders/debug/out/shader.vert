#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec2 positions[12] = vec2[](
    // Coordinates are divided by 20 for perfect visualization
    vec2(0.1, 0.2), // Coordinates (2,4)
    vec2(0.4, 0.2),  // Coordinates (8,4)
    vec2(0.5, 0.4),   // Coordinates (10,8)
    vec2(0.5, 0.4),   // Coordinates (10,8)
    vec2(0.35, 0.6), // Coordinates (7,12)
    vec2(0.15, 0.6),   // Coordinates (3, 12)
    vec2(0.15, 0.6),   // Coordinates (3,12)
    vec2(0.0, 0.4),     // Coordinates (0,8)
    vec2(0.1, 0.2),  // Coordinates (2,4)
    vec2(0.1, 0.2), // Coordinates (2,4)
    vec2(0.5, 0.4), // Coordinates (10,8)
    vec2(0.15,0.6) // Coordinates (3,12)
);
vec3 colors[1] = vec3[](
  vec3(1, 0, 0)
);


void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}