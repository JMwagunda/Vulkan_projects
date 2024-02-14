#version 450

layout(location = 0) out vec3 fragColor;

layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

// Define an array of 2D vectors representing the positions of vertices of a rectangle
vec2 positions[6] = vec2[](
   vec2(0.5, 0.4), // Vertex 1: Top left corner
   vec2(0.8, 0.1), // Vertex 2: Top right corner
   vec2(0.8, 0.4), // Vertex 3: Bottom right corner
   vec2(0.5, 0.1), // Vertex 4: Bottom left corner
   vec2(0.8, 0.1), // Vertex 5: Top right corner (repeated for triangle strip)
   vec2(0.5, 0.4)  // Vertex 6: Top left corner (repeated for triangle strip)
);

// Define an array of 3D vectors representing the colors of the rectangle
vec3 colors[1] = vec3[](
    vec3(1, 1, 0) // A single color for the entire rectangle (yellow)
);

void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}