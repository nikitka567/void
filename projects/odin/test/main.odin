package main

import "core:strings"
import "core:os"
import "core:math"
import "core:fmt"

w, h :: 45, 45
grid := [w * h]i32{}
used := [w * h]i32{}
convinc :: proc(n: i32) -> string {
	switch n {
	case 1: return "@"
	case 2: return "R"
	case: return "."
	}
}

rgb :: proc(n: i32) {
	if n == 0 {
		fmt.print("\x1b[0m")
		return
	}
	fmt.printf("\x1b[38;5;%vm", n)
}
set :: proc(x, y: i32, val: i32) {
	grid[y * w + x] = val
}
setline :: proc(x0, y0, x1, y1, val: i32) {
	x0, y0, x1, y1 := x0, y0, x1, y1
	f := math.abs(y1 - y0) > math.abs(x1 - x0)
	if f {
		x0, y0 = y0, x0
		x1, y1 = y1, x1
	}
	if x0 > x1 {
		x0, x1 = x1, x0
		y0, y1 = y1, y0
	}
	dx := x1 - x0
	dy := math.abs(y1 - y0)
	err := dx / 2
	ystep: i32 = 1 if (y0 < y1) else -1
	y := y0
	for x := x0; x <= x1; x += 1 {
		set(f ? y : x, f ? x : y, val)
		err -= dy
		if err < 0 {
			y += ystep
			set(f ? y : x, f ? x : y, val)
			err += dx
		}
	}
}

dfs :: proc(x, y, i: i32) {
	if used[y * w + x] != 0 {
		return
	}
  used[y * w + x] = i
	if (x < w - 1 && grid[y * w + x] == grid[y * w + x + 1]) {
		dfs(x + 1, y, i)
	}
	if (x > 0 && grid[y * w + x] == grid[y * w + x - 1]) {
		dfs(x - 1, y, i)
	}
	if (y < h - 1 && grid[y * w + x] == grid[y * w + x + w]) {
		dfs(x, y + 1, i)
	}
	if (y > 0) && grid[y * w + x] == grid[y * w + x - w] {
		dfs(x, y - 1, i)
	}
}

fimos :: proc() {
	used = {}
	z:i32 = 1
	for i:i32 = 0; i < w * h; i+=1 {
		if used[i] != 0 || grid[i] == 0 {
			continue
		}
		dfs(i % w, i / w, z)
		z+=1
	}
	for i := 0; i < w * h; i+=1 {
		if i % w == 0 && i != 0 {
			fmt.println()
		}
		rgb(used[i])
		fmt.printf("%v ", convinc(grid[i]))
		
	}
	fmt.println()
}

main :: proc() {
	enable_raw_mode()
	defer disable_raw_mode()
  strings.builder_init(&str)
  defer strings.builder_destroy(&str)
	in_stream = os.to_stream(os.stdin)
	fmt.print("\x1b[2J\x1b[H")
	cur_inc: i32 = 0
	draw := false
	for {
		ch := get()

		switch ch{
		case 'h':
			fmt.print("\x1b[2D")
		case 'j':
			fmt.print("\x1b[1B")
		case 'k':
			fmt.print("\x1b[1A")
		case 'l':
			fmt.print("\x1b[2C")
		case 'w':
			cur_inc = 1
		case 'q':
			cur_inc = 0
		case 'd':
			draw = !draw
		case:
			fmt.print(ch)
		}
		if draw {
			x, y := get_cursor()
			grid[y * h + x / 2 - h] = cur_inc
			fmt.print("\x1b7\x1b[H")
			fimos()
			fmt.print("\x1b8")
		}


	}
	setline(0, 0, 5, 10, 1)
	setline(16, 0, 8, 14, 1)
  
	
}

