#include <iostream>
#include <string>
using namespace std;


class Pessoa 
{
protected:
    string nome;
public:
    Pessoa(string n) 
    {
        nome = n;
    }
    virtual void apresentar() 
    {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
};


class Professor : public Pessoa 
{
private:
    string disciplina;

public:
    Professor(string n, string d) : Pessoa(n) 
    {
        disciplina = d;
    }

    void apresentar() override 
    {
        cout << "Olá, meu nome é " << nome
             << " e eu sou um professor de " << disciplina << "." << endl;
    }
};


class Aluno : public Pessoa 
{
private:
    string curso;

public:
    Aluno(string n, string c) : Pessoa(n) 
    {
        curso = c;
    }

    void apresentar() override 
    {
        cout << "Olá, meu nome é " << nome
             << " e eu sou um aluno de " << curso << "." << endl;
    }
};

int main() 
{

    Professor prof("Carlos", "Programação");
    Aluno aluno("Ana", "Engenharia de Software");
    Pessoa* p1 = &prof;
    Pessoa* p2 = &aluno;
    p1->apresentar();
    p2->apresentar();

    return 0;
}