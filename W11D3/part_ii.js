// functions accept more args than asked for?
// we use semicolons on statments in addition to nested functions or callbacks?
// scope of let limited to current function or can it be passed to nested function?
// difference between function types and syntax (ex: constructor)
// function Test(){} = constructor function
context = this
// fat arrow passes along 'this' (current instance of opening function?)
// default to using const
// you can redeclare var variables but you get an error when redclaring let variables?
// are callbacks nested?

//fat arrows or vars can be called back?
example: 

// defining the function
function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};


// invoking the function
titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});



