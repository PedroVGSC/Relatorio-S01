package main

import "fmt"


func fibonacci(n int) {

	a := 0
	b := 1

	//Se tiver os dois primeiros citados no exercicio vai aparecer por isso essa validacao
	if n >= 1 {
		fmt.Println(a, " ")
	}
	if n >= 2 {
		fmt.Println(b, " ")
	}

	// gera os próximos números com um for
	for i := 2; i < n; i++ {
		c := a + b
		fmt.Println(c, " ")
		a = b
		b = c
	}
}

func main() {
	
	var n int

	fmt.Print("Quantos números da sequência Fibonacci você quer ver? ")
	fmt.Scanln(&n)

	fibonacci(n)
}