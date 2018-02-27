package main

import (
	"bufio"
	"fmt"
	"strings"
)

func main() {
	s := strings.NewReader("ABCDEFG")
	br := bufio.NewReader(s)

	c, _ := br.ReadByte()
	fmt.Printf("%c\n", c)
	fmt.Println(br.Buffered()) //6
	// A

	c, _ = br.ReadByte()
	fmt.Printf("%c\n", c)
	fmt.Println(br.Buffered()) //5
	// B

	br.UnreadByte()
	c, _ = br.ReadByte()
	fmt.Printf("%c\n", c)
	// B
}
