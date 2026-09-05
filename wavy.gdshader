shader_type canvas_item;

// Exposed parameters in the Inspector
uniform sampler2D bg_texture : repeat_enable;
uniform vec2 scroll_speed = vec2(0.05, 0.05);
uniform float wave_amplitude = 0.03;
uniform float wave_frequency = 10.0;
uniform float wave_speed = 3.0;

void fragment() {
    // 1. Calculate continuous scrolling over time
    vec2 uv = UV + (TIME * scroll_speed);
    
    // 2. Apply sine wave horizontal distortion
    float wave = sin((uv.y * wave_frequency) + (TIME * wave_speed)) * wave_amplitude;
    uv.x += wave;
    
    // 3. Sample the texture at the distorted UV coordinates
    COLOR = texture(bg_texture, uv);
}
