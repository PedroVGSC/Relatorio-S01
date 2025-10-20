class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} está a tocar #{peca} no piano."
  end
end

class Violinista < Musico
  def tocar_partitura(peca)
    puts "#{@nome} está a tocar #{peca} no violino."
  end
end

class Maestro
  def initialize(musicos = [])
    @musicos = musicos
  end

  def adicionar_musico(m)
    @musicos << m
  end

  def iniciar_ensaio(peca)
    puts "Ensaio da peça: #{peca}"
    @musicos.each { |m| m.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado}!" }
  end
end

musicos = []
musicos << Pianista.new("Kousei", "Piano")
musicos << Violinista.new("Kaori", "Violino")

maestro = Maestro.new(musicos)

puts "Digite o nome da peça para o ensaio:"
peca = gets.chomp

maestro.iniciar_ensaio(peca)

puts "Digite o novo estado de foco (ex: Concentrado):"
estado = gets.chomp

mensagens = maestro.mudar_foco(estado)
puts "-----"
mensagens.each { |msg| puts msg }
