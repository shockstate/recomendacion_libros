(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then TRUE 
       else FALSE))


(defrule determine-user-state ""
	(not (pers extr?))
	=>
	(if (yes-or-no-p "Prefieres autores estranjeros (yes/no)?")
     		then
      			(assert (pers extr TRUE))
      		else
      			(assert (pers extr FALSE))))
	



(defrule reducirEstranjeros "solo acepta los de la nacionalidad o los de fuera"
	(Persona (Extranjeros TRUE) (Nacionalidad ?n)) (Autores (Nacionalidad ?m) (haEscrito ?l) (test (?n neq ?m))
	=>
	(assert (recomendacion ?l 1)) (printout)

(defrule print-recomendacion "imprimeix"
	(declare (salience 10))
	(recomendacion ?np ?nl)
	=>
	(printout t ?np?nl crlf))


;(defrule popularidad "solo acepta los libros con ventas superiores a 1000000 ejemplares"
;	(Persona (BestSellers TRUE) (nom ?np)) (Libro (Nom ?nl)(NunVentas ?nv&:(> ?nv 1000000)))
;	=>
;	(assert (recomendacion ?nl 1)))


