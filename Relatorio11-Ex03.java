import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        
        Poder poderFogo = new Poder("Bola de Fogo");
        Poder poderLaser = new Poder("Raio Desintegrador");

        Youkai raposa = new Youkai("Kurama", "Floresta de Kyoto", poderFogo);
        Alien et = new Alien("Zim", "Setor 7", poderLaser, "Irk", "Voot Cruiser");

        RegistroOculto registro = new RegistroOculto("Equipe A");

        System.out.println("--- Teste do Registro (HashMap) ---");
        registro.registrarAvistamento(raposa);
        registro.registrarAvistamento(et);
        
        System.out.println("\n--- Tentando registrar de novo ---");
        registro.registrarAvistamento(raposa); // Tentativa de duplicata

        System.out.println("\n--- Teste de Rastreamento (Polimorfismo) ---");
        
        Rastreavel entidade1 = raposa;
        Rastreavel entidade2 = et;
        
        System.out.println(entidade1.obterCoordenadas());
        System.out.println(entidade2.obterCoordenadas());
        
        System.out.println("\n--- Conteúdo do Registro ---");
        registro.mostrarRegistros();
    }
}

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

abstract class Entidade {
    private String nome;
    private String localizacao;

    public Entidade(String nome, String localizacao) {
        this.nome = nome;
        this.localizacao = localizacao;
    }

    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }
}

class Youkai extends Entidade implements Rastreavel {
    
    private Poder poder; // Regra 3: Composição

    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao);
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return "[RASTREADO] Youkai " + getNome() + " (Poder: " + poder.getNome() + ") em " + getLocalizacao();
    }
}

class Alien extends Entidade implements Rastreavel {
    
    private String planetaOrigem;
    private String ovni;
    private Poder poder; // Regra 3: Composição

    public Alien(String nome, String localizacao, Poder poder, String planetaOrigem, String ovni) {
        super(nome, localizacao);
        this.poder = poder;
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "[RASTREADO] Alien " + getNome() + " (Nave: " + this.ovni + ") em " + getLocalizacao();
    }
}

class RegistroOculto {
    
    private String nomeEquipe;
    private HashMap<String, Entidade> _avistamentos; // Regra 4: HashMap

    public RegistroOculto(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this._avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidade entidade) {
        String nomeEntidade = entidade.getNome();
        
        if (this._avistamentos.containsKey(nomeEntidade)) {
            System.out.println("Falha no registro: '" + nomeEntidade + "' já foi avistado.");
            return false;
        } else {
            this._avistamentos.put(nomeEntidade, entidade);
            System.out.println("Sucesso: '" + nomeEntidade + "' registrado pela " + this.nomeEquipe + ".");
            return true;
        }
    }
    
    public void mostrarRegistros() {
        for (String nome : this._avistamentos.keySet()) {
            System.out.println("- " + nome);
        }
    }
}
