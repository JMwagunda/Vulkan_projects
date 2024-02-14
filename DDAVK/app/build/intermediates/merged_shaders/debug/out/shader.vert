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
   // X-Axis Coordinates
   vec2(-1.0, 0.0),
   vec2(1.0, 0.0),
   // Y-Axis Coordinates
   vec2(0.0, -1.0),
   vec2(0.0, 1.0),
   // DDA line
   vec2(-0.2, -0.3),
   vec2(-0.1, -0.3),
   vec2(0.0, -0.2),
   vec2(0.1, -0.1),
   vec2(0.2, -0.0),
   vec2(0.3, 0.1),
   vec2(0.4, 0.1),
   vec2(0.5, 0.2)
);


vec3 colors[3] = vec3[](
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2),
    vec3(0.67, 0.1, 0.2)
);

void main() {
   gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);

   if (gl_VertexIndex < 4) {
       fragColor = vec3(0.0, 0.0, 0.0);
   } else {
       fragColor = vec3(1, 1, 0);
   }

}