import java.util.HashMap;
import java.util.LinkedHashSet;

public class Main {
    public static void main(String[] args) {
        
        Ataque slam = new Ataque("Pisão Trovejante", 40);
        Ataque fireBreath = new Ataque("Baforada de Fogo", 60);
        Ataque magicMissile = new Ataque("Míssil Mágico", 80);

        Boss bossComum = new Boss("Behemoth", "b-001", "Gelo");
        bossComum.adicionarAtaque(slam);
        bossComum.adicionarAtaque(fireBreath);

        BossMagico bossMago = new BossMagico("Lich", "bm-002", "Luz");
        bossMago.adicionarAtaque(magicMissile);
        bossMago.adicionarAtaque(new Ataque("Drenar Vida", 50));
        
        Batalha arenaFinal = new Batalha("Coliseu Quebrado");
        
        arenaFinal.adicionarBoss(bossComum);
        arenaFinal.adicionarBoss(bossMago);

        System.out.println("\n--- INICIANDO BATALHAS ---");
        arenaFinal.iniciarBatalha("bm-002"); // Inicia o Lich
        
        System.out.println("---");
        arenaFinal.iniciarBatalha("b-001"); // Inicia o Behemoth
        
        System.out.println("---");
        arenaFinal.iniciarBatalha("id-inexistente"); // Teste de falha
    }
}

class Ataque {
    private String nome;
    private int dano;

    public Ataque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() { return nome; }
    public int getDano() { return dano; }
}

class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<Ataque> _moveset; // 1. Composição

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this._moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(Ataque ataque) {
        this._moveset.add(ataque);
        System.out.println("Ataque '" + ataque.getNome() + "' adicionado ao moveset de " + this.nome);
    }

    public void iniciarFase() {
        System.out.println("Boss " + this.nome + " entra na arena! Ponto fraco: " + this.pontoFraco);
        System.out.println("Moveset:");
        for (Ataque a : _moveset) {
            System.out.println("- " + a.getNome() + " (" + a.getDano() + " dano)");
        }
    }

    public String getNome() { return nome; }
    public String getIdBoss() { return idBoss; }
}

class BossMagico extends Boss { // 1. Herança
    
    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("Boss Mágico " + getNome() + " distorce a realidade da arena!");
        super.iniciarFase(); 
    }
}

class Batalha {
    private String nomeArena;
    private HashMap<String, Boss> _arena; // 2. Agregação

    public Batalha(String nomeArena) {
        this.nomeArena = nomeArena;
        this._arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        String id = boss.getIdBoss();
        this._arena.put(id, boss);
        System.out.println("Boss " + boss.getNome() + " (ID: " + id + ") foi adicionado à arena " + this.nomeArena);
    }

    public void iniciarBatalha(String idBoss) { // 3. Método
        if (this._arena.containsKey(idBoss)) {
            Boss boss = this._arena.get(idBoss);
            System.out.println("\n[BATALHA INICIADA] Em " + this.nomeArena + " contra " + boss.getNome());
            boss.iniciarFase();
        } else {
            System.out.println("\n[FALHA] Boss com ID '" + idBoss + "' não encontrado na arena.");
        }
    }
}
