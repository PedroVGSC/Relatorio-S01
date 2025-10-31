class Hunter {
  #nome
  #idade
  #localizacao
  constructor(nome, local = "", idade = 0) {
    this.#nome = String(nome)
    this.#idade = Number(idade)
    this.#localizacao = String(local)
  }
  getNome() {
    return this.#nome
  }
  getIdade() {
    return this.#idade
  }
  getLocalizacao() {
    return this.#localizacao
  }
  atualizarLocalizacao(latitude, longitude) {
    this.#localizacao = `${latitude},${longitude}`
  }
}

class Especialista extends Hunter {
  #habilidadeNen
  constructor(nome, habilidade) {
    super(nome)
    this.#habilidadeNen = String(habilidade)
  }
  rastrearLocal(lat, long) {
    this.atualizarLocalizacao(lat, long)
    return `Especialista ${this.getNome()} (${this.#habilidadeNen}) em ${this.getLocalizacao()}`
  }
}

class Manipulador extends Hunter {
  #alvoAtual
  constructor(nome) {
    super(nome)
    this.#alvoAtual = null
  }
  definirAlvo(hunter) {
    if (hunter instanceof Hunter) this.#alvoAtual = hunter
  }
  rastrearLocal(lat, long) {
    this.atualizarLocalizacao(lat, long)
    const alvo = this.#alvoAtual ? this.#alvoAtual.getNome() : "sem alvo"
    return `Manipulador ${this.getNome()} (${alvo}) em ${this.getLocalizacao()}`
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set()
  }
  adicionarHunter(hunter) {
    if (!hunter || typeof hunter.rastrearLocal !== "function") return
    const duplicado = [...this.hunters].some(h => h.getNome() === hunter.getNome())
    if (!duplicado) this.hunters.add(hunter)
  }
  getNumHunters() {
    return this.hunters.size
  }
  iniciarRastreamento(lat, long) {
    return [...this.hunters].map(h => h.rastrearLocal(lat, long))
  }
}

/* Demonstração simples */
const gon = new Especialista("Gon", "Jajanken")
const killua = new Manipulador("Killua")
killua.definirAlvo(gon)

const b = new Batalhao()
b.adicionarHunter(gon)
b.adicionarHunter(killua)
b.adicionarHunter(new Especialista("Gon", "Outro")) 

console.log(b.getNumHunters())
console.log(b.iniciarRastreamento("-23.56", "-46.63"))
