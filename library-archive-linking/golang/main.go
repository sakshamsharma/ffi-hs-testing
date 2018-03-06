package main

import "C"

func strFxn(input string) string {
	return "Hello " + input + " World"
}

//export StrFxn
func StrFxn(cinput *C.char) *C.char {
	input := C.GoString(cinput)
	return C.CString(strFxn(input))
}

func main() {}
