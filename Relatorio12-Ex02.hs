data Item = Item String String Double deriving (Show)
data CompraZelda = CompraZelda [Item] deriving (Show)

somaItens :: [Item] -> Double
somaItens itens = sum [p | Item _ _ p <- itens]

calculaDesconto :: [Item] -> Double
calculaDesconto itens =
    let total = somaItens itens
    in if total > 200 then total * 0.9 else total

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda itens)
    | somaItens itens <= 200 = somaItens itens + 15.0
    | otherwise = calculaDesconto itens

main :: IO ()
main = do
    let espada = Item "Master Sword" "Arma" 150.0
    let pocao = Item "Pocao Vermelha" "Pocao" 30.0
    let escudo = Item "Hylian Shield" "Equipamento" 100.0
    
    let compraPequena = CompraZelda [pocao]
    let compraGrande = CompraZelda [espada, escudo]
    
    print (valorFinal compraPequena)
    print (valorFinal compraGrande)
