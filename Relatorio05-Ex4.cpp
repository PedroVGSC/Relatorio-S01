#include <iostream>
using namespace std;


double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}


double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;
    double celsius;

    do {
        
        cout << "\n===== Conversor de Unidades =====\n";
        cout << "1. Converter Celsius para Fahrenheit\n";
        cout << "2. Converter Celsius para Kelvin\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Em Fahrenheit: " << celsiusParaFahrenheit(celsius) << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Em Kelvin: " << celsiusParaKelvin(celsius) << endl;
                break;

            case 3:
                cout << "Saindo do programa...\n";
                break;

            default:
                cout << "Opcao invalida! Tente novamente.\n";
        }
    } while (opcao != 3);

    return 0;
}