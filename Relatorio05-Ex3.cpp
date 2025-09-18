#include <iostream>
using namespace std;

int main() {
    int quantidade;
    float nota, soma = 0, media;

   
    cout << "Digite quantas notas voce quer inserir: ";
    cin >> quantidade;

    
    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a nota " << i + 1 << " (entre 0 e 10): ";
        cin >> nota;

        
        while (nota < 0 || nota > 10) {
            cout << "Nota invalida! Digite novamente (entre 0 e 10): ";
            cin >> nota;
        }

        soma = soma + nota; 
    }

    
    media = soma / quantidade;

    
    cout << "Sua media final : " << media << endl;

    
    if (media >= 7) {
        cout << "Aprovado" << endl;
    } else {
        cout << "Reprovado" << endl;
    }

    return 0;
}