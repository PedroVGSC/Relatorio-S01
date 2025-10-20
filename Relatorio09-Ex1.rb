class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base
  end

  def preco_base
    @preco_base
  end

  def preco_base=(valor)
    if valor.to_f > 0
      @preco_base = valor.to_f
    else
      puts "Preço inválido! Definindo como 0."
      @preco_base = 0
    end
  end

  def to_s
    "Drink: #{@nome}, Preço base: $#{@preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @anos_desde_criacao = anos_desde_criacao.to_i
  end

  def preco_final
    @preco_base + (5 * @anos_desde_criacao)
  end

  def to_s
    "Drink Lenda: #{@nome} | Anos: #{@anos_desde_criacao} | Preço final: $#{preco_final}"
  end
end

puts "Digite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base:"
preco = gets.chomp.to_f

puts "Digite quantos anos desde a criação:"
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco, anos)

puts
puts "=== Resultado ==="
puts drink