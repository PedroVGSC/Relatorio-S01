module Rastreavel
  attr_accessor :localizacao_atual

  def obter_localizacao(hora)
    "#{@nome} estava em #{@localizacao_atual} às #{hora}"
  end
end

module Perigoso
  def calcular_risco
    100
  end
end

class Participante
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end

  def to_s
    @nome
  end
end

class Detetive < Participante
  include Rastreavel
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
end

class Cenario
  def initialize(participantes = [])
    @participantes = participantes
  end

  def adicionar(p)
    @participantes << p
  end

  def lista_rastreavel
    @participantes.select { |p| p.respond_to?(:obter_localizacao) }
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

sherlock = Detetive.new("Sherlock")
moriarty = MestreDoCrime.new("Moriarty")

puts "Digite a localização atual de Sherlock:"
sherlock.localizacao_atual = gets.chomp

puts "Digite a localização atual de Moriarty:"
moriarty.localizacao_atual = gets.chomp

cenario = Cenario.new([sherlock, moriarty])

puts "Digite a hora atual (ex: 14:20):"
hora = gets.chomp

puts "----- Rastreamento -----"
cenario.lista_rastreavel.each { |p| puts p.obter_localizacao(hora) }

puts "----- Alvos perigosos -----"
cenario.identificar_ameacas.each { |p| puts "#{p.nome} com risco #{p.calcular_risco}" }
