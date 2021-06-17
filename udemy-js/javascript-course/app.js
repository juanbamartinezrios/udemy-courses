// function constructor
let func = new Function( "x", "y", "return x*y;" );
console.log( func( 5, 6 ) );

// recursion
function factorial( num ) {
    if ( num <= 0 ) {
        return 1;
    } else {
        return ( num * factorial( num - 1 ) );
    }
}

console.log( factorial( 5 ) );

// anonymous function
( function () {
    console.log( "anonymous function" );
} )(); // se define y se llama inmediatamente

// parameters
// fat arrow notation
// statemen

// variation 1
var food = ( x, y, z ) => {
    return x * y * z;
}
console.log( "food: ", food( 10, 20, 30 ) );

// variation 2
var food = ( x ) => x * 10;
console.log( "food: ", food( 10 ) );

// generator functions
// Articulo: 4 ways to use Generator Functions | Examples | Adventages

// cookies
document.cookie = "username=Juanba;";
let exp = new Date();
exp.setMonth( exp.getMonth() * 1 );
document.cookie = "username=Juanba; expires=" + exp.toUTCString() + ";";

// para eliminar la cookie hay que setear la fecha de expiración a una fecha anterior
exp.setMonth( exp.getMonth() * -1 );

// alert, confirm, prompt
function demo() {
    alert( "Your computer is affected by Virus!" );

    const retVal = confirm( "Are you sure?" );
    if ( retVal == true ) {
        alert( "yes" );
    } else {
        alert( "no" );
    }

    const inputVal = prompt( "Enter your name:" );
    document.write( "Welcome " + inputVal );
}

// JS Objets
// objects inicialization
let student = {
    usn: "114",
    firstName: "Tharun",
    lastName: "Shiv",
    greet: function () { return "Hello guys!"; },
    subjects: [ "Web dev", "AI", "blockchain" ]
}

// object constructor
let myLaptop = new Object();
let propertyName = "resolution";
myLaptop.brand = "HP";
myLaptop.cores = "8";
myLaptop.storage = "1 TB";
myLaptop[ propertyName ] = "1080p";

console.log( JSON.stringify( myLaptop ) );

// object create()
// para crear objectos sin el object constructor
const occupation = {
    type: "none",
    displayType: function () {
        console.log( this.type );
    }
};

let police = Object.create( occupation );
police.type = "web developer";
police.displayType();


// object assing
// cloning
let student1 = {
    name: "Juanba",
    age: 27
};

let tutor = {};
tutor = Object.assign( {}, student1 );
console.log( student1 );
console.log( tutor );

// appending
let student2 = {
    name: "Juanba",
    age: 27
};
let skills = {
    languages: "Python, Javascript",
    experience: 3
};
student2 = Object.assign( {}, student2, skills );
console.log( student2 );

// merging
let student3 = {
    name: "Juanba",
    age: 27
};
let skills2 = {
    languages: "Python, Javascript",
    experience: 3
};
let hobbies = {
    activity: "Running"
};
student2 = Object.assign( student3, student3, skills2, hobbies );
console.log( student3 );

// MAP
let newSalaryList = employees.map( ( employee ) => { employee.salary *= 1.25; } );
console.log( newSalaryList );

// REDUCE
const array1 = [ 1, 2, 3, 4 ];
const reducer = ( accumulator, currentValue ) => accumulator + currentValue;
// 1 + 2 + 3 + 4
console.log( array1.reduce( reducer ) );
// expected output: 10

// 5 + 1 + 2 + 3 + 4
console.log( array1.reduce( reducer, 5 ) );
// expected output: 15

// SOME
let isSalLessThan15 = employees.some( ( employee ) => employee.salary > 2000 );

// FIND y FINXbyINDEX
let findEmployee = employees.find( ( employee ) => employees.name === "Tharun" );
let findEmployee = employees.findIndex( ( employee ) => employees.name === "Tharun" );