class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome
    this.perigosa = Boolean(perigosa)
  }
}

class Diario {
  #autorSecreto
  constructor(autor) {
    this.#autorSecreto = autor
    this.enigmas = new Map()
    this.criaturasAvistadas = []
  }
  getAutor() {
    return this.#autorSecreto
  }
  adicionarEnigma(num, enigma) {
    this.enigmas.set(Number(num), String(enigma))
  }
  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) return "Acesso negado"
    const e = this.enigmas.get(Number(num))
    return e ? `Enigma ${num}: ${e}` : "Enigma não encontrado"
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome
    this.idade = Number(idade)
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, autor) {
    super(nome, idade)
    this.diario = new Diario(autor)
  }
}

class CabanaMisterio {
  constructor(diario) {
    this.diario = diario
    this.visitantes = []
    this.funcionarios = []
  }
  adicionarFuncionario(p) {
    if (p instanceof Personagem) this.funcionarios.push(p)
  }
  listarFuncionarios() {
    return this.funcionarios
  }
}

/* Demonstração simples */
const dipper = new Protagonista("Dipper", 12, "autor123")
dipper.diario.adicionarEnigma(1, "A floresta esconde segredos")
dipper.diario.adicionarEnigma(2, "Olhe para o céu à meia-noite")
console.log(dipper.diario.decodificar("autor123", 1))

const mabel = new Personagem("Mabel", 12)
const stan = new Personagem("Tio Stan", 60)
const cabana = new CabanaMisterio(dipper.diario)
cabana.adicionarFuncionario(mabel)
cabana.adicionarFuncionario(stan)

console.log(cabana.listarFuncionarios())
