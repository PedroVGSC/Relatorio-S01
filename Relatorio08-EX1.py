class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, nova_vida):
        if nova_vida < 0:
            self._vida = 0
        else:
            self._vida = nova_vida

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência."


class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "sim" if self.armadura_pesada else "não"
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e armadura pesada: {tipo_armadura}."


personagem1 = Personagem(100, 50)
print(personagem1)

cavaleiro1 = Cavaleiro(150, 80, True)
print(cavaleiro1)

cavaleiro1.vida = -20
print("Vida ajustada:", cavaleiro1.vida)
