from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} ativa BARREIRA IMPLACÁVEL! Protege a equipe.")


class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} libera RAJADA FATAL! Causa muito dano.")


herois = [
    Tanque("Reinhardt", "Tanque"),
    Dano("Tracer", "Dano"),
    Tanque("Winston", "Tanque"),
    Dano("Soldado-76", "Dano"),
]

for h in herois:
    print(h)
    h.usar_ultimate()
