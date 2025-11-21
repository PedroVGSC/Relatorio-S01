(defstruct item
  nome
  tipo
  preco
  forca-magica)

(setq catalogo
  (list
    (make-item :nome "Espada Amaldiçoada" :tipo "Arma" :preco 100 :forca-magica 90)
    (make-item :nome "Adaga de Mercúrio" :tipo "Arma" :preco 50 :forca-magica 60)
    (make-item :nome "Poção de Invisibilidade" :tipo "Pocao" :preco 30 :forca-magica 5)
    (make-item :nome "Amuleto da Sorte" :tipo "Artefato" :preco 80 :forca-magica 10)
    (make-item :nome "Machado do Caos" :tipo "Arma" :preco 150 :forca-magica 110)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let*
    ((armas
      (remove-if-not
        (lambda (i) (equal (item-tipo i) "Arma"))
        catalogo))
    (armas-com-imposto
      (mapcar
        (lambda (i) (setf (item-preco i) (adiciona-imposto (item-preco i))) i)
        armas)))
    (mapcar
      (lambda (i)
        (format nil "~A, Força Mágica Nova: ~A"
          (item-nome i)
          (bonus-maldicao (item-forca-magica i))))
      armas-com-imposto)))

(processa-venda catalogo)
