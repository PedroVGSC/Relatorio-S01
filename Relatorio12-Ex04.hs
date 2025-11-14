data Servico = Servico String String Double deriving (Show)
data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show, Eq)
data Atendimento = Atendimento [Servico] StatusAtendimento deriving (Show)

bonusEspiritual :: [Servico] -> Double
bonusEspiritual servicos =
    let totalBase = sum [p | Servico _ _ p <- servicos]
        comBonus = if length servicos > 3 then totalBase * 1.25 else totalBase
    in if comBonus > 500 then comBonus * 0.90 else comBonus

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0.0
valorFinalAtendimento (Atendimento servicos _) = bonusEspiritual servicos

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum servico"
descricaoPrimeiroServico (Atendimento (Servico nome tipo _ : _) _) = nome ++ " - " ++ tipo

main :: IO ()
main = do
    let s1 = Servico "Banho de Ervas" "Banho" 150.0
    let s2 = Servico "Massagem" "Massagem" 100.0
    let s3 = Servico "Banquete" "Comida" 300.0
    let s4 = Servico "Sauna" "Banho" 80.0

    let atendimentoNormal = Atendimento [s1, s2] EmAndamento
    let atendimentoCheio = Atendimento [s1, s2, s3, s4] Finalizado
    let atendimentoCancelado = Atendimento [s1, s2] Cancelado

    print (valorFinalAtendimento atendimentoNormal)
    print (descricaoPrimeiroServico atendimentoNormal)
    
    print (valorFinalAtendimento atendimentoCheio)
    
    print (valorFinalAtendimento atendimentoCancelado)
