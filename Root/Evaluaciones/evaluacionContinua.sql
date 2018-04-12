# Daniel Tapia Nava A01022285
# Bases de Datos Avanzadas

 # Evaluacion Continua

 # Pregunta 1)
 db.grades.aggregate({$group: {_id: '$student_id'}},{$group: {_id: 1,count: {$sum: 1}}})

 #La respuesta fue 50 

 # pregunta 2)

 db.grades.aggregate({$group: {_id: '$class_id'}},{$group: {_id: 1,count: {$sum: 1}}})

 # respuesta fue 31 cursos

# Pregunta 4)

 db.grades.aggregate{[{$unwind: "$scores"},{ $group: { _id: {} , calificacionMin: {$min: "$scores.score"}}}]}

 /* 5 Tareas son las que mas se han dejado en un curso
 	6 Materias son las maximas que ha inscrito un alumno
 	7 Fueron los mas reprobados en una materia 

 	*/

 	