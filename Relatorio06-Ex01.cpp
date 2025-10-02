#include <iostream>
#include <string>
using namespace std;


class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;
    void atacar(Personagem &alvo) 
    {
        cout << nome << " atacou " << alvo.nome << " causando " 
             << dano << " de dano!" << endl;
        alvo.vida -= dano;
        if (alvo.vida < 0) 
        {
            alvo.vida = 0;
        }
    }

    void mostrarStatus() 
    {
        cout << "Nome: " << nome << " | Nível: " << nivel 
             << " | Vida: " << vida << " | Dano: " << dano << endl;
    }
};

int main() 
{
    Personagem p1;
    p1.nome = "Guerreiro";
    p1.nivel = 5;
    p1.dano = 20;
    p1.vida = 100;
    Personagem p2;
    p2.nome = "Mago";
    p2.nivel = 4;
    p2.dano = 15;
    p2.vida = 80;

    cout << "=== Status inicial ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();

    cout << endl;
    p1.atacar(p2);
    cout << endl;
    cout << "=== Após o combate ===" << endl;
    p1.mostrarStatus();
    p2.mostrarStatus();

    return 0;
}