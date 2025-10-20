class MicroondasUnidade
  def aquecer_por(segundos)
    puts "Aquecendo por #{segundos} segundos..."
  end
end

class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "D-Mail: '#{@conteudo}' enviado às #{@hora_envio}"
  end
end

class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails = []
  end

  def enviar_dmail
    puts "Digite o conteúdo do D-Mail:"
    conteudo = gets.chomp
    puts "Digite a hora de envio (ex: 10:30):"
    hora = gets.chomp
    @unidade.aquecer_por(3)
    dmail = DMail.new(conteudo, hora)
    @dmails << dmail
    puts "D-Mail enviado!"
  end

  def listar_dmails(horario_corte)
    selecionados = @dmails.select { |d| d.hora_envio > horario_corte }
    if selecionados.empty?
      puts "Nenhum D-Mail após #{horario_corte}."
    else
      puts "D-Mails após #{horario_corte}:"
      selecionados.each { |d| puts d }
    end
  end
end

telefone = TelefoneDeMicroondas.new
telefone.enviar_dmail

puts "Digite o horário de corte (ex: 09:00):"
corte = gets.chomp
telefone.listar_dmails(corte)