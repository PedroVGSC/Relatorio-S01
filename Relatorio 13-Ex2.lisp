(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(setq catalogo
  (list
    (make-criatura :nome "Safe Shallows" :ambiente "Shallows" :periculosidade "Baixa" :vida-media 10)
    (make-criatura :nome "Reaper Leviathan" :ambiente "Deep" :periculosidade "Alta" :vida-media 500)
    (make-criatura :nome "Ghost Leviathan" :ambiente "Deep" :periculosidade "Alta" :vida-media 1000)
    (make-criatura :nome "Crab Snake" :ambiente "Deep" :periculosidade "Média" :vida-media 50)))

(defun filtra-por-perigo (catalogo)
  (remove-if-not
    (lambda (c) (not (equal (criatura-periculosidade c) "Baixa")))
    catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar
    (lambda (c)
      (format nil "~A: Vive em ~A" (criatura-nome c) (criatura-ambiente c)))
    (remove-if-not
      (lambda (c) (equal (criatura-ambiente c) "Deep"))
      catalogo)))

(relatorio-profundidade catalogo)
