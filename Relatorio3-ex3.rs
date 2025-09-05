use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        let resultado = numero * i;
        println!("{} x {} = {}", numero, i, resultado);
    }
}

fn main() {
    println!("=== GERADOR DE TABUADA ===");
    println!();
    
    // Pede ao usuário o número da tabuada
    println!("Digite o número da tabuada:");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let numero: i32 = input.trim().parse().expect("Por favor, digite um número válido");
    
    // Pede ao usuário o limite inferior
    println!("Digite o limite inferior:");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let limite_inferior: i32 = input.trim().parse().expect("Por favor, digite um número válido");
    
    // Pede ao usuário o limite superior
    println!("Digite o limite superior:");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let limite_superior: i32 = input.trim().parse().expect("Por favor, digite um número válido");
    
    println!();
    println!("=== TABUADA DO {} ===", numero);
    
    // Chama a função imprimir_tabuada com os três números fornecidos pelo usuário
    imprimir_tabuada(numero, limite_inferior, limite_superior);
}