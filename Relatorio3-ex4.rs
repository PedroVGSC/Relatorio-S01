use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    //Calcula a média ponderada usando os pesos: 2 para nota1, 3 para nota2, 5 para nota3
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;
    
    let media = (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / (peso1 + peso2 + peso3);
    media
}

fn main() {
    println!("=== CALCULADORA DE MÉDIA PONDERADA ===");
    println!();
    
    //Pede ao usuário para digitar a primeira nota
    println!("Digite a primeira nota (peso 2):");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let nota1: f64 = input.trim().parse().expect("Por favor, digite um número válido");
    
    //Pede ao usuário para digitar a segunda nota
    println!("Digite a segunda nota (peso 3):");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let nota2: f64 = input.trim().parse().expect("Por favor, digite um número válido");
    
    //Pede ao usuário para digitar a terceira nota
    println!("Digite a terceira nota (peso 5):");
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a entrada");
    let nota3: f64 = input.trim().parse().expect("Por favor, digite um número válido");
    
    println!();
    println!("=== RESULTADO ===");
    println!("Nota 1: {} (peso 2)", nota1);
    println!("Nota 2: {} (peso 3)", nota2);
    println!("Nota 3: {} (peso 5)", nota3);
    
    //Chama a função calcular_media com essas notas e imprime o resultado da média
    let media = calcular_media(nota1, nota2, nota3);
    println!("Média ponderada: {:.2}", media);
    
    //Use um if/else para verificar se a média é maior ou igual a 7 e imprimir se o aluno foi "Aprovado" ou "Reprovado"
    if media >= 7.0 {
        println!("Resultado: Aprovado! 🎉");
    } else {
        println!("Resultado: Reprovado 😞");
    }
}   //Dei a vida nesse relatório kkkkkk