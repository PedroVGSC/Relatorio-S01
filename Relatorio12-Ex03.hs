data Banda = Banda String String Double deriving (Show)
data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show, Eq)
data Evento = Evento [Banda] StatusEvento deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento (Evento bandas _) = (sum [c | Banda _ _ c <- bandas]) * 1.20

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda"
bandaAbertura (Evento (Banda nome _ _ : _) _) = nome

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda"
bandaEncerramento (Evento bandas _) = 
    let Banda nome _ _ = last bandas
    in nome

main :: IO ()
main = do
    let b1 = Banda "Beatles Cover" "Rock" 2000.0
    let b2 = Banda "Jazz Trio" "Jazz" 1500.0
    
    let eventoAtivo = Evento [b1, b2] Ativo
    let eventoEncerrado = Evento [b1] Encerrado
    let eventoCancelado = Evento [b1, b2] Cancelado
    
    print (custoTotalEvento eventoAtivo)
    print (bandaAbertura eventoAtivo)
    print (bandaEncerramento eventoAtivo)
    
    print (custoTotalEvento eventoEncerrado)
    print (custoTotalEvento eventoCancelado)
