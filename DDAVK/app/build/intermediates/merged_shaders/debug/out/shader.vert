#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

vec2 positions[12] = vec2[](
   vec2(-1.0, 0.0), // X-Axis Coordinates
   vec2(1.0, 0.0),
   vec2(0.0, -1.0),    // Y-Axis Coordinates
   vec2(0.0, 1.0),
   vec2(-0.2, -0.3),    // DDA line
   vec2(-0.1, -0.3),
   vec2(0.0, -0.2),
   vec2(0.1, -0.1),
   vec2(0.2, -0.0),
   vec2(0.3, 0.1),
   vec2(0.4, 0.1),
   vec2(0.5, 0.2)
);

void main() {
   gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);

   if (gl_VertexIndex < 4) {
       fragColor = vec3(0.0, 0.0, 0.0);
   } else {
       fragColor = vec3(0, 0, 1);
   }

}