#version 450

layout(location = 0) out vec3 fragColor;

layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec2 positions[4] = vec2[](
   vec2(-1.0, 0.0),    // X-Axis Coordinates
   vec2(1.0, 0.0),
   vec2(0.0, -1.0),    // Y-Axis Coordinates
   vec2(0.0, 1.0)
);
vec3 colors[4] = vec3[](
    vec3(0.0, 0.0, 0.0),
    vec3(0.0, 0.0, 0.0),
    vec3(0.0, 0.0, 0.0),
    vec3(0.0, 0.0, 0.0)
);

void main() {
   gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
   fragColor = colors[gl_VertexIndex];
}