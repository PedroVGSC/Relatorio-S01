class ODM_Gear {
  #gasRestante
  constructor(modelo) {
    this.modelo = modelo
    this.#gasRestante = 100
  }
  usarGas(quantidade) {
    const q = Math.max(0, Number(quantidade))
    this.#gasRestante = Math.max(0, this.#gasRestante - q)
    return this.#gasRestante
  }
  getGas() {
    return this.#gasRestante
  }
}

class Soldado {
  #gear
  constructor(nome, modeloGear) {
    this.nome = nome
    this.#gear = new ODM_Gear(modeloGear)
  }
  explorarTerritorio() {
    this.#gear.usarGas(15)
    return `${this.nome} explorou. Gas: ${this.#gear.getGas()}`
  }
  verificarEquipamento() {
    return `Gear ${this.#gear.modelo} | Gas: ${this.#gear.getGas()}`
  }
}

class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider
    this.membros = []
    membrosIniciais.forEach(m => this.adicionarMembro(m))
  }
  adicionarMembro(soldado) {
    if (soldado && typeof soldado.explorarTerritorio === 'function') {
      this.membros.push(soldado)
    }
  }
  explorarTerritorio() {
    if (this.membros.length === 0) return `Esquadrão sem membros`
    const a = this.membros.map(s => s.explorarTerritorio()).join(' | ')
    return `Líder ${this.lider}: ${a}`
  }
  relatarStatus() {
    return this.membros.map(s => `${s.nome}: ${s.verificarEquipamento()}`)
  }
}

/* Demonstração simples */
const levi = new Esquadrao("Levi")
const mikasa = new Soldado("Mikasa", "ODM-MKII")
const armin = new Soldado("Armin", "ODM-MKI")
levi.adicionarMembro(mikasa)
levi.adicionarMembro(armin)

console.log(mikasa.verificarEquipamento())
console.log(armin.verificarEquipamento())
console.log(levi.explorarTerritorio())
console.log(levi.relatarStatus())
