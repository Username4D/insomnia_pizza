shader_type canvas_item;

uniform vec2 player_world_pos;
uniform float radius = 100.0;

varying vec2 world_pos;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 0, 1)).xy;
}

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	float dist = distance(world_pos, player_world_pos);
	float a_mask =0.35 +  (0.65 * smoothstep(radius - 10.0, radius, dist));
	COLOR = texture_color;
	COLOR.a = a_mask;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
