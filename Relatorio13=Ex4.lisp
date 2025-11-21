(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista-ocorrencias)
  (if (null lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
         (soma-medo-recursiva (cdr lista-ocorrencias)))))

(defun analise-final (lista-ocorrencias)
  (let*
    ((soma (soma-medo-recursiva lista-ocorrencias))
     (media (/ soma (length lista-ocorrencias)))
     (ocorrencias-criticas
       (remove-if-not
         (lambda (o)
           (and
             (> (ocorrencia-agentes-enviados o) 3)
             (> (ocorrencia-nivel-medo o) media)))
         lista-ocorrencias)))
    (mapcar
      (lambda (o) (ocorrencia-nome o))
      ocorrencias-criticas)))

(setq teste-ocorrencias
  (list
    (make-ocorrencia :nome "Vozes no Porão" :ritual "Sim" :nivel-medo 60 :agentes-enviados 2)
    (make-ocorrencia :nome "Chuva de Sapo" :ritual "Não" :nivel-medo 90 :agentes-enviados 5)
    (make-ocorrencia :nome "Fantasmas no Museu" :ritual "Sim" :nivel-medo 80 :agentes-enviados 4)
    (make-ocorrencia :nome "Luzes Estranhas" :ritual "Não" :nivel-medo 30 :agentes-enviados 1)))

(analise-final teste-ocorrencias)
