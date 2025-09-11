package main

import ( "fmt")

func main() {

	var numero int
	fmt.Println("Digite um numero: ")
	fmt.Scanln(&numero)

	resto := numero % 2
	switch resto {
	case 0:
			fmt.Println("O número é Par")
	default:
			fmt.Println("O número é Impar")
	}
}