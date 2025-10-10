using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; }
    public Feitico(string nome) { Nome = nome; }
    public override string ToString() => Nome;
}

class Grimorio
{
    private List<Feitico> feiticos = new List<Feitico>();
    public void AdicionarFeitico(Feitico f) { feiticos.Add(f); }
    public IEnumerable<Feitico> Listar() => feiticos;
}

class Ferramenta
{
    public string Nome { get; }
    public Ferramenta(string nome) { Nome = nome; }
    public override string ToString() => Nome;
}

class Maga
{
    public string Nome { get; }
    public Grimorio Grimorio { get; }
    public List<Ferramenta> Ferramentas { get; }
    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Grimorio = new Grimorio();
        Ferramentas = ferramentas;
    }
}

class Program
{
    static void Main(string[] args)
    {
        var ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Capacete"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Kit de Primeiros Socorros")
        };

        var frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Rajada Arcana"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Barreira Mágica"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Luz Sagrada"));

        Console.WriteLine("Feitiços no Grimório:");
        foreach (var f in frieren.Grimorio.Listar()) Console.WriteLine("- " + f);

        Console.WriteLine("\nFerramentas agregadas:");
        foreach (var ferr in frieren.Ferramentas) Console.WriteLine("- " + ferr);

        Console.WriteLine("\nPressione qualquer tecla para sair...");
        Console.ReadKey();
    }
}