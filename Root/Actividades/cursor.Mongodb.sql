use universidad
db.createCollection("cursos")

db.cursos.insert({titulo:"Bases de Datos"})

db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $set:{
            profesor:""
        }
    }
)

db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $set: 
        {
            profesor: {
                nombre: "Ariel",
                nomina:"L???",
                direccion:"Algun lado",
                genero:"hombre"
            }
        }
    }
)

db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $set:{
            año:2018
        }
    }
)


db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $set:{
            evaluaciones:{
                teoricas:100,
                practicas:150
            }
        }
    }
)

db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $set:{
            alumnos:[]
        }
    }
)

db.cursos.update(
    {titulo:"Bases de Datos"},
    {
        $push:{
            alumnos:{
                nombre:"persona",
                matricula:"A01019514",
                direccion: "Algun lado",
                genero: "mujer",
                eval_curso: 100,
                eval_prof: 100,
                comentarios: "ola k ase",
                calificaciones:[
                    95,
                    100,
                    98,
                    92
                ],
                final: 95
            }
        }
    }
)

# Estructura resultante:
> db.cursos.find().pretty()
{
        "_id" : ObjectId("5aa997e2ec3dbcb2fd16899b"),
        "titulo" : "Bases de Datos",
        "profesor" : {
                "nombre" : "Ariel",
                "nomina" : "L???",
                "direccion" : "Algun lado",
                "genero" : "hombre"
        },
        "año" : 2018,
        "evaluaciones" : {
                "teoricas" : 100,
                "practicas" : 150
        },
        "alumnos" : [
                {
                        "nombre" : "Paco",
                        "matricula" : "A01019512",
                        "direccion" : "Algun lado",
                        "genero" : "hombre",
                        "eval_curso" : 100,
                        "eval_prof" : 100,
                        "comentarios" : "ola k ase",
                        "calificaciones" : [
                                95,
                                100,
                                98,
                                92
                        ],
                        "final" : 98
                },
                {
                        "nombre" : "Paco2",
                        "matricula" : "A01019513",
                        "direccion" : "Algun lado",
                        "genero" : "hombre",
                        "eval_curso" : 100,
                        "eval_prof" : 100,
                        "comentarios" : "ola k ase",
                        "calificaciones" : [
                                95,
                                100,
                                98,
                                92
                        ],
                        "final" : 90
                },
                {
                        "nombre" : "persona",
                        "matricula" : "A01019514",
                        "direccion" : "Algun lado",
                        "genero" : "mujer",
                        "eval_curso" : 100,
                        "eval_prof" : 100,
                        "comentarios" : "ola k ase",
                        "calificaciones" : [
                                95,
                                100,
                                98,
                                92
                        ],
                        "final" : 95
                }
        ]
}

# Promedio
db.cursos.aggregate([
    { $unwind: "$alumnos" },
    { $group : { _id: "$titulo", avgFinal : {  $avg : "$alumnos.final" } } }
])

# Promedio final por curso
db.cursos.aggregate([
    { $unwind: "$alumnos" },
    { $group : { _id: "$titulo", avgFinal : {  $avg : "$alumnos.final" } } }
])

# Genero por curso
db.cursos.aggregate([
    { $unwind: "$alumnos" },
    {
        $match:{
            "alumnos.genero":"hombre"
        }
    },
    { 
        $group:{ 
            _id: "$titulo",
            count: {$sum:1}
        }
    }
])