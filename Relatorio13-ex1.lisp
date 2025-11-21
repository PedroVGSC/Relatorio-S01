(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 5) (< peso 20)) 10)
    ((and (<= 5 idade 12) (>= peso 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((equal nome-da-erva "Ginseng") (* preco-base 3.0))
    ((equal nome-da-erva "Lótus") (* preco-base 1.5))
    (t preco-base)))

(ajusta-preco 10 "Lótus")
