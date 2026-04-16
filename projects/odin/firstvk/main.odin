#+feature dynamic-literals
package main

import "core:fmt"

udro :: union{i32, bool, []i32}

main :: proc() {
	a: udro = []i32{0, 1, 2}
	switch v in a {
	case i32: fmt.println(v + 5)
	case bool: fmt.println(!v)
	case []i32: fmt.println(v[0])
	}
}

