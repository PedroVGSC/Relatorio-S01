data Bebida = Bebida String String Double deriving (Show)
data Status = Aberto | Entregue | Cancelado deriving (Show, Eq)
data Pedido = Pedido [Bebida] Status deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido (Pedido _ Cancelado) = 0.0
valorTotalPedido (Pedido bebidas _) = sum [preco | Bebida _ _ preco <- bebidas] + 5.0

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido"
primeiraBebida (Pedido (Bebida nome _ _ : _) _) = nome

main :: IO ()
main = do
    let cafe = Bebida "Expresso" "Cafe" 10.0
    let suco = Bebida "Suco de Laranja" "Suco" 12.0
    let pedido1 = Pedido [cafe, suco] Aberto
    let pedido2 = Pedido [cafe] Cancelado
    let pedido3 = Pedido [] Entregue

    print (valorTotalPedido pedido1)
    print (primeiraBebida pedido1)
    
    print (valorTotalPedido pedido2)
    
    print (primeiraBebida pedido3)
