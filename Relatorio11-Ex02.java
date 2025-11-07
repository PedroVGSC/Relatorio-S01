import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        
        Cafe cafeComum = new Cafe("Leblanc Blend", 5.0);
        Cafe cafeGourmet = new CafeGourmet("Blue Mountain", 8.0, 3.0);
        
        ArrayList<Cafe> listaDeCafes = new ArrayList<>();
        listaDeCafes.add(cafeComum);
        listaDeCafes.add(cafeGourmet);
        
        Menu menuPrincipal = new Menu(listaDeCafes);
        
        menuPrincipal.adicionarItem(new Cafe("Expresso", 4.0));
        
        CafeLeblanc cafeteria = new CafeLeblanc(menuPrincipal);
        
        cafeteria.receberPedido(cafeComum);
        
        System.out.println("--- Menu e Preços (Teste de Polimorfismo) ---");
        
        for (Cafe cafe : cafeteria.getMenu().getItens()) {
            System.out.println("Item: " + cafe.getNome() + " | Preço Final: R$ " + cafe.calcularPrecoFinal());
        }
    }
}

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return this.precoBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return super.getPrecoBase() + this.bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    public void adicionarItem(Cafe cafe) {
        this.itens.add(cafe);
        System.out.println("Item " + cafe.getNome() + " adicionado ao menu.");
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }
}

class CafeLeblanc {
    private Menu _menu;

    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome());
    }

    public Menu getMenu() {
        return this._menu;
    }
}
