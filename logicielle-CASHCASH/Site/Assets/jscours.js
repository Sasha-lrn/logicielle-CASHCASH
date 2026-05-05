let prenom = "Louis"
let age = 21
console.log("Je m'appelle " + prenom + " et j'ai " + age + " ans.");
let note = 12
if (note >= 10){
    console.log("admis")
} else {
    console.log("non admis")
}
for (let i = 0; i <11; i++) {
    console.log(i)
}
let nombre = [0,1,2,3,4,5,6,7,8,9,10]
for ( let i = 0 ; i< nombre.length;i++){
    console.log(nombre[i])
}
let n = 1
while (n<6) {
    console.log(n)
    n++
}
function produit(a,b){
    return a*b
}
console.log(produit(5,5))