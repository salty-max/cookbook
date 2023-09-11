pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

function _init()
  spd = 3
  r1 = {
    x = 24,
    y = 40,
    w = 32,
    h = 32,
    c = 8
  }

  r2 = {
    x = 70,
    y = 80,
    w = 32,
    h = 32,
    c = 12
  }

  r3 = {
    x = 0,
    y = 0,
    w = 0,
    h = 0,
    c = 11
  }
end

function _update()
  if btn(0) then
    r1.x -= spd
  elseif btn(1) then
    r1.x += spd
  end

  if btn(2) then
    r1.y -= spd
  elseif btn(3) then
    r1.y += spd
  end

  if rect_rect(r1, r2) then
    -- Compute the left, right, top, and bottom of the overlapping rectangle
    local left = max(r1.x, r2.x)
    local right = min(r1.x + r1.w, r2.x + r2.w)
    local top = max(r1.y, r2.y)
    local bottom = min(r1.y + r1.h, r2.y + r2.h)

    -- Update r3 with the computed values
    r3.x = left
    r3.y = top
    r3.w = right - left
    r3.h = bottom - top
  else
    r3.w = 0
    r3.h = 0
  end
end

function _draw()
  cls(0)
  if rect_rect(r1, r2) then
    print_center("collision", 20, 8)
  else
    print_center("no collision", 20, 11)
  end

  rect(r1.x, r1.y, r1.x + r1.w, r1.y + r1.h, r1.c)
  rect(r2.x, r2.y, r2.x + r2.w, r2.y + r2.h, r2.c)

  if r3.w > 0 and r3.h > 0 then
    rectfill(r3.x, r3.y, r3.x + r3.w, r3.y + r3.h, r3.c)
  end
end

function rect_rect(r1, r2)
  return r1.x + r1.w > r2.x
      and r1.x < r2.x + r2.w
      and r1.y + r1.h > r2.y
      and r1.y < r2.y + r2.h
end

function print_center(s, y, c)
  print(s, 64 - #s * 2, y, c)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
