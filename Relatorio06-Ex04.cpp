#include <iostream>
#include <string>
#include <vector>
using namespace std;


class SerVivo 
{
protected:
    string nome;

public:
    SerVivo(string n) : nome(n) {}


    virtual void apresentar() 
    {
        cout << "Sou um ser vivo chamado " << nome << "." << endl;
    }
};

class Humano : public SerVivo 
{
public:
    Humano(string n) : SerVivo(n) {}

    void apresentar() override 
    {
        cout << "Olá! Sou o humano " << nome << "." << endl;
    }
};


class Elfo : public SerVivo 
{
public:
    Elfo(string n) : SerVivo(n) {}

    void apresentar() override 
    {
        cout << "Saudações. Sou o elfo " << nome << "." << endl;
    }
};


class Fada : public SerVivo 
{
public:
    Fada(string n) : SerVivo(n) 
    { }

    void apresentar() override 
    {
        cout << "Brilhos e pó mágico! Sou a fada " << nome << "." << endl;
    }
};

int main() 
{

    vector<SerVivo*> seres;

    Humano h("Arthur");
    Elfo e("Legolas");
    Fada f("Tinker");
    seres.push_back(&h);
    seres.push_back(&e);
    seres.push_back(&f);

    for (SerVivo* s : seres) 
    {
        s->apresentar();
    }
    return 0;
}