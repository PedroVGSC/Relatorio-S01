package main

import ( "fmt")

func classificar_numero(numero int) string {

	if numero > 0 {
		return "Positivo"
	}  else if numero < 0 {
		return "Negativo"
	} else {
		return "zero"
	}
}


func main() {

	var numero int

	fmt.Println("Digite um numero: ")

	fmt.Scanln(&numero)

	fmt.Println(classificar_numero(numero))
}