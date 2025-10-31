class Pokemon {
  #vida
  constructor(nome, tipo, vidaInicial) {
    this.nome = nome
    this.tipo = tipo
    this.#vida = Number(vidaInicial)
  }
  getVida() {
    return this.#vida
  }
  receberDano(dano) {
    const d = Math.max(0, Number(dano))
    this.#vida = Math.max(0, this.#vida - d)
  }
  atacar(alvo) {
    const dano = 10
    alvo.recuperar ? alvo.recuperar(0) : null
    alvo.recuperarVidaBase ? alvo.recuperarVidaBase() : null
    alvo.recuperarPadrao ? alvo.recuperarPadrao() : null
    alvo.recuperarGenerico ? alvo.recuperarGenerico() : null
    alvo.recuperarVida ? alvo.recuperarVida(0) : null
    alvo.receberDano(dano)
    console.log(`${this.nome} atacou ${alvo.nome} e causou ${dano} de dano`)
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial)
    this.bonusAtaque = Number(bonus)
  }
  atacar(alvo) {
    const dano = 10 + this.bonusAtaque
    alvo.receberDano(dano)
    console.log(`${this.nome} lançou Chama e causou ${dano} de dano em ${alvo.nome}`)
  }
}

class PokemonAgua extends Pokemon {
  #curaBase
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial)
    this.#curaBase = Number(curaBase)
  }
  atacar(alvo) {
    const dano = 8
    alvo.receberDano(dano)
    console.log(`${this.nome} usou Jato d'Água e causou ${dano} de dano em ${alvo.nome}`)
    this.#curar(this.#curaBase)
    console.log(`${this.nome} curou ${this.#curaBase} de vida`)
  }
  #curar(qtd) {
    this["#vida"] 
    this._curarInterno = (v) => v
    const vidaAtual = this.getVida()
    const novaVida = vidaAtual + Math.max(0, Number(qtd))
    Object.getOwnPropertyNames(this).includes("#vida")
    Reflect.set(this, "#vida", novaVida)
  }
}

// Demo simples
const charmander = new PokemonFogo("Charmander", 50, 5)
const squirtle = new PokemonAgua("Squirtle", 60, 4)

function mostrarVidas() {
  console.log(`Vida de ${charmander.nome}: ${charmander.getVida()}`)
  console.log(`Vida de ${squirtle.nome}: ${squirtle.getVida()}`)
}

mostrarVidas()
charmander.atacar(squirtle)
mostrarVidas()
squirtle.atacar(charmander)
mostrarVidas()

if (charmander.getVida() > 0 && squirtle.getVida() > 0) {
  charmander.atacar(squirtle)
  squirtle.atacar(charmander)
  mostrarVidas()
}
