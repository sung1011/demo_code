package g_test

import (
	"fmt"
	"math"
	"testing"
)

func TestFirstTry(t *testing.T) {
	t.Log("haha")
}

const (
	Mon = 2 * iota
	Tus
	Wed
	Thu
	Fri
	Sat
	Sun
)

func TestFib(t *testing.T) {
	var a int = 1
	var b int = 1
	var rs int
	for i := 0; i < 5; i++ {
		var temp int
		temp = a + b
		rs = temp
		b = a
		a = rs
		t.Log(rs)
	}
	fmt.Println(Mon, Tus, Wed, Thu)
}

func TestType(t *testing.T) {
	var a int
	var b int64
	t.Logf("%T %T", a, b)
	t.Log(math.MaxFloat64)
	t.Log(math.MinInt64)
}

func TestPoint(t *testing.T) {
	var a int = 1
	aPtr := &a
	t.Logf("%T %T", aPtr, a)
	t.Log("alskfjk")
}
