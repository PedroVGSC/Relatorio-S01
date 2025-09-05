use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    println!("=== JOGO PAR OU ÍMPAR ===");
    println!();
    
    // Jogador 1 escolhe par ou ímpar
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Falha ao ler a entrada");
    let escolha = escolha.trim().to_lowercase();
        // Jogador 1 digita seu número
    println!("Jogador 1, digite um número:");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let numero1: i32 = input.trim().parse().expect("Por favor, digite um número válido");
    
    // Jogador 2 digita seu número
    println!("Jogador 2, digite seu número:");
    let mut input2 = String::new();
    io::stdin()
        .read_line(&mut input2)
        .expect("Falha ao ler a entrada");
    let numero2: i32 = input2.trim().parse().expect("Por favor, digite um número válido");
    
    // Calcula a soma dos números
    let soma = numero1 + numero2;
    
    // Usa a função eh_par para verificar se a soma é par ou ímpar
    let soma_eh_par = eh_par(soma);
    
    // Determina quem venceu
    let jogador1_venceu = if escolha == "par" {
        soma_eh_par  // Jogador 1 vence se escolheu par e a soma é par
    } else {
        !soma_eh_par // Jogador 1 vence se escolheu ímpar e a soma é ímpar
    };
    
    // Imprime o resultado
    println!();
    println!("=== RESULTADO ===");
    println!("Jogador 1: {}", numero1);
    println!("Jogador 2: {}", numero2);
    println!("Soma: {}", soma);
    println!("A soma é {}", if soma_eh_par { "PAR" } else { "ÍMPAR" });
    println!();
    
    if jogador1_venceu {
        println!("🎉 Jogador 1 venceu!");
    } else {
        println!("🎉 Jogador 2 venceu!");
            }
}