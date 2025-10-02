#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:

    Pessoa(string n, int i) 
    
    {
        nome = n;
        idade = i;
    }
    string getNome() 
    {
        return nome;
    }

    int getIdade() {
        return idade;
    }
};


class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) 
    {
        nivel = nv;
    }

    int getNivel() 
    {
        return nivel;
    }
};


class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) 
    {
        rank = r;
    }

    int getRank() 
    {
        return rank;
    }
};

int main() 
{

    Protagonista heroi("Akira", 17, 5);
    Personagem aliado("Ryuji", 16, 7);

    cout << "Protagonista: " << heroi.getNome()
         << " | Idade: " << heroi.getIdade()
         << " | Nível: " << heroi.getNivel() << endl;

    cout << "Aliado: " << aliado.getNome()
         << " | Idade: " << aliado.getIdade()
         << " | Rank: " << aliado.getRank() << endl;

    return 0;
}