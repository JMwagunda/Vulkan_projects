#version 450

// Colour passed to the fragment shader
layout(location = 0) out vec3 fragColor;

// Uniform buffer containing an MVP matrix.
// Currently the vulkan backend only sets the rotation matix
// required to handle device rotation.
layout(binding = 0) uniform UniformBufferObject {
    mat4 MVP;
} ubo;

// Define an array of 2D vectors representing the positions of vertices of a polygon
vec2 positions[12] = vec2[](
    // Coordinates are divided by 20 for perfect visualization
    vec2(0.1, 0.2),  // Vertex 1: Top left corner (Coordinates (2,4))
    vec2(0.4, 0.2),  // Vertex 2: Top right corner (Coordinates (8,4))
    vec2(0.5, 0.4),  // Vertex 3: Right top corner (Coordinates (10,8))
    vec2(0.5, 0.4),  // Vertex 4: Right top corner (Coordinates (10,8))
    vec2(0.35, 0.6), // Vertex 5: Right bottom corner (Coordinates (7,12))
    vec2(0.15, 0.6), // Vertex 6: Left bottom corner (Coordinates (3,12))
    vec2(0.15, 0.6), // Vertex 7: Left bottom corner (Coordinates (3,12))
    vec2(0.0, 0.4),  // Vertex 8: Left top corner (Coordinates (0,8))
    vec2(0.1, 0.2),  // Vertex 9: Top left corner (Coordinates (2,4))
    vec2(0.1, 0.2),  // Vertex 10: Top left corner (Coordinates (2,4))
    vec2(0.5, 0.4),  // Vertex 11: Right top corner (Coordinates (10,8))
    vec2(0.15, 0.6)  // Vertex 12: Left bottom corner (Coordinates (3,12))
);

// Define an array of 3D vectors representing the colors of the polygon
vec3 colors[1] = vec3[](
    vec3(1, 0, 0) // A single color for the entire polygon (red)
);



void main() {
    gl_Position = ubo.MVP * vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragColor = colors[gl_VertexIndex];
}