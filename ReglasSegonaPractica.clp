ficar com a atributs la relacio

(defrule reducirEstranjeros "solo acepta los de la nacionalidad o los de fuera"
	(Persona (Extranjeros TRUE) (Nacionalidad ?n) (nom ?z)) (Autores (Nacionalidad ?m)) (test (?n neq ?m))
	=>
	(assert) recomendacion ?z ?p))          )



tengo que hacer otra regla para que los hechos que me interessan los imprima por pantalla
