use std::io;

fn verificar_senha(senha: &str) -> bool {
    // Verifica se tem pelo menos 8 caracteres
    if senha.len() < 8 {
        return false;
    }
    
    // Verifica se contém pelo menos um número
    let tem_numero = senha.chars().any(|c| c.is_ascii_digit());
    if !tem_numero {
        return false;
    }
    
    // Verifica se contém pelo menos uma letra maiúscula
    let tem_maiuscula = senha.chars().any(|c| c.is_ascii_uppercase());
    if !tem_maiuscula {
        return false;
    }
    
    true
}

fn main() {
    loop {
        println!("Digite uma senha:");
        
        let mut senha = String::new();
        io::stdin()
            .read_line(&mut senha)
            .expect("Falha ao ler a entrada");
            
        // Remove a quebra de linha
        let senha = senha.trim();
        
        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida! A senha deve:");
            println!("- Ter pelo menos 8 caracteres de comprimento");
            println!("- Conter pelo menos um número");
            println!("- Conter pelo menos uma letra maiúscula");
            println!();
        }
    }
}