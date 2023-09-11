pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

function _init()
  frame = 0
  px, py = 60, 60
  dx = 0
  p_spr = 1
  p_flip = false
  p_anm = { 2, 3, 4 }
end

function _update60()
  frame += 1
  dx = 0
  p_spr = 1

  if btn(0) then
    p_flip = true
    dx = -1
  end
  if btn(1) then
    p_flip = false
    dx = 1
  end

  if dx != 0 then
    p_spr = p_anm[1 + flr(frame / 8) % #p_anm]
  end

  px += dx
end

function _draw()
  cls()
  spr(p_spr, px, py, 1, 1, p_flip)
end

__gfx__
00000000008888800088888000888880008888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000044fff00044fff00044fff00044fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070004f1f1f004f1f1f004f1f1f004f1f1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000044f4440044f4440044f4440044f44400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000c88c0000cc880000cc880000c88c700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070007a88a7000ca887000cc780000a88a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc0004cccc0000cccc0007cccc400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004004000000040000000400004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000