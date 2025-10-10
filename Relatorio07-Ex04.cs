using System;

abstract class MonstroSombrio
{
    public string Nome { get; }
    protected MonstroSombrio(string nome) { Nome = nome; }
    public virtual void Mover()
    {
        Console.WriteLine(Nome + " se move nas sombras.");
    }
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) {}
    public override void Mover()
    {
        Console.WriteLine(Nome + " cambaleia lentamente.");
    }
}

class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) {}
    public override void Mover()
    {
        Console.WriteLine(Nome + " atravessa paredes rapidamente.");
    }
}

class Program
{
    static void Main(string[] args)
    {
        MonstroSombrio[] horda = new MonstroSombrio[]
        {
            new Zumbi("Zumbi Lerdo"),
            new Espectro("Espectro Rápido")
        };

        foreach (var m in horda) m.Mover();

        Console.WriteLine("Pressione qualquer tecla para sair...");
        Console.ReadKey();
    }
}