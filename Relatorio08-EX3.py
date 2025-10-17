class ArmaCorpoACorpo:
    def __init__(self, nome):
        self.nome = nome


class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma


class Joker:
    def __init__(self, membros):
        self.arma = ArmaCorpoACorpo("Faca do Joker")
        self.membros = membros

    def mostrar_equipe(self):
        print("Equipe Phantom Thieves:")
        for m in self.membros:
            print(f"{m.nome} usa {m.arma.nome}")
        print(f"Joker usa {self.arma.nome}")


m1 = PhantomThieves("Mona", ArmaCorpoACorpo("Estilingue"))
m2 = PhantomThieves("Panther", ArmaCorpoACorpo("Chicote"))
m3 = PhantomThieves("Skull", ArmaCorpoACorpo("Porrete"))

joker = Joker([m1, m2, m3])
joker.mostrar_equipe()
