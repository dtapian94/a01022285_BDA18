// Daniel Tapia Nava
// A01022285
// Bases de Datos Avanzadas
// Map Reduce


// Pregunta 1
db.restaurants.group(
    {
        key: {
            'address.zipcode':1
        },
        reduce: function( curr, result ) {
            result.total += 1;
        },
        initial: { total : 0 }
    }
)

//  Pregunta 2
db.restaurants.aggregate({
    $project: {
        name:"$name",
        count:{
            $size:"$grades"
        }
    }
});

// Pregunta 3
db.restaurants.aggregate([
    {$unwind: "$grades"},
    {
        "$group": {
            "_id": "$name", 
            "total": {
                "$sum": "$grades.score"
            }
        }
    },
    {
        $project: {
            total:1
        }
    }
]);

// Pregunta 4
db.restaurants.mapReduce(
    function() {
        var As = 0;
        var Bs = 0;
        var Cs = 0;
        this.grades.forEach(
            (value)=>{
                if(value.grade === "A"){
                    As = 1;
                }
                else if(value.grade === "B"){
                    Bs = 1;
                }
                else if(value.grade === "C"){
                    Cs = 1;
                }
            });
        emit("A", As);
        emit("B", Bs);
        emit("C", Cs);
    },
    function(name, count) {
        return Array.sum(count);
    },
    {out:"res"}
)

// Pregunta 5

ar countCuisine = function(){
    emit(this.cuisine, 1)
}

var countPerCuisine = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(countCuisine, countPerCuisine, {out:"perCuisine"}).find();

// Pregunta 6

var mapClose = function(){
    var lat = -73.9653967;
    var long = 40.6064339;

    this.address.coord
}

var countClose = function(name, values){
    return Array.sum(values);
}

db.restaurants.mapReduce(mapClose, countClose, {out:"tenCloser"}).find();
