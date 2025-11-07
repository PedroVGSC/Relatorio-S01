import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        Mago howl = new Mago("Mago Howl", 27, "Magia de Fogo e Portais");
        Castelo casteloAnimado = new Castelo("Castelo Animado");

        Divisao salaPrincipal = new Divisao("Sala de Estar com Lareira");
        Divisao cozinha = new Divisao("Cozinha Mágica");
        Divisao quartoDoHowl = new Divisao("Quarto do Howl");

        casteloAnimado.adicionarDivisao(salaPrincipal);
        casteloAnimado.adicionarDivisao(cozinha);
        casteloAnimado.adicionarDivisao(quartoDoHowl);

        System.out.println("------------------------------------");
        System.out.println("Personagem principal: " + howl.getNome());
        System.out.println(howl.lancarFeitico());
        System.out.println("------------------------------------");
        System.out.println("Divisões do " + casteloAnimado.getNome() + ":");

        for (Divisao div : casteloAnimado.getDivisoes()) {
            System.out.println("- " + div.getNome());
        }
    }
}

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return this.idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String lancarFeitico() {
        return this.nome + " está lançando o feitiço: " + this.magia + "!";
    }

    public String getMagia() {
        return this.magia;
    }

    public void setMagia(String magia) {
        this.magia = magia;
    }
}

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    public void adicionarDivisao(Divisao divisao) {
        this.divisoes.add(divisao);
        System.out.println("A divisão '" + divisao.getNome() + "' foi adicionada ao " + this.nome);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return this.divisoes;
    }
}
