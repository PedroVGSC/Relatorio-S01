using System;
using System.Collections.Generic;

class Pokemon
{
    public string Nome { get; private set; }
    public Pokemon(string nome) { Nome = nome; }
    public virtual void Atacar()
    {
        Console.WriteLine(Nome + " usa um ataque!");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) {}
    public override void Atacar()
    {
        Console.WriteLine(Nome + " lança um jato de fogo!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) {}
    public override void Atacar()
    {
        Console.WriteLine(Nome + " lança um jato de água!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<Pokemon> lista = new List<Pokemon>();
        lista.Add(new PokemonDeFogo("Charizard"));
        lista.Add(new PokemonDeAgua("Blastoise"));

        foreach (var p in lista) p.Atacar();

        Console.WriteLine("Pressione qualquer tecla para sair...");
        Console.ReadKey();
    }
}