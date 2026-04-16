package main

import "core:strconv"
import "core:strings"
import "core:io"
import "core:unicode/utf8"
import "core:os"
import "core:fmt"

import psx "core:sys/posix"

@(private="file")
orig_mode: psx.termios
in_stream: io.Stream
str: strings.Builder
enable_raw_mode :: proc() {
	// Get the original terminal attributes.
	res := psx.tcgetattr(psx.STDIN_FILENO, &orig_mode)
	assert(res == .OK)

	// Reset to the original attributes at the end of the program.
	psx.atexit(disable_raw_mode)

	// Copy, and remove the
	// ECHO (so what is typed is not shown) and
	// ICANON (so we get each input instead of an entire line at once) flags.
	raw := orig_mode
	raw.c_lflag -= {.ECHO, .ICANON}
	res = psx.tcsetattr(psx.STDIN_FILENO, .TCSANOW, &raw)
	assert(res == .OK)
}

disable_raw_mode :: proc "c" () {
	psx.tcsetattr(psx.STDIN_FILENO, .TCSANOW, &orig_mode)
}

get :: proc() -> rune {
		ch, _, err := io.read_rune(in_stream)
		if err != nil {
			fmt.eprintfln("\nError: %v", err)
			return ' '
		}
		return ch

}

get_cursor :: proc() -> (i32, i32) {
	fmt.print("\x1b[6n")
	ch := get()
	ch = get()
	strings.builder_reset(&str)
	for ch != ';' {
		ch = get()
		if ch == ';' {
			break
		}
		strings.write_rune(&str, ch)
	}
	y, _ := strconv.parse_int(strings.to_string(str))
	strings.builder_reset(&str)
	for ch != 'R' {
		ch = get()
		if ch == 'R' {
			break
		}
		strings.write_rune(&str, ch)
	}
	x, _ := strconv.parse_int(strings.to_string(str))
	return i32(x), i32(y)
}
