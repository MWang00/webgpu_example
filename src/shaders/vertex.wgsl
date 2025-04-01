struct Out {
  @builtin(position) pos: vec4<f32>,
  @location(0) cell: f32,
};

@binding(0) @group(0) var<uniform> size: vec2<u32>;

@vertex
fn main(
  @builtin(instance_index) i: u32,
  @location(0) cell: u32,
  @location(1) pos: vec2<u32>
) -> Out {
  let w = size.x;
  let h = size.y;
  let x = ((f32(i % w) + f32(pos.x)) / f32(w) - 0.5) * 2.0 * f32(w) / f32(max(w, h));
  let y = ((f32((i - (i % w)) / w) + f32(pos.y)) / f32(h) - 0.5) * 2.0 * f32(h) / f32(max(w, h));
  return Out(vec4<f32>(x, y, 0.0, 1.0), f32(cell));
}