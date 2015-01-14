/*
    Referential Transparency
    Jake Payton - Functional Programming Concepts in Swift
*/

// Referentially Opaque

var globalValue = 0;

func opaque(x: Int) -> Int {
    globalValue++
    return x + globalValue
}

println(opaque(1))
println(opaque(1))
println(opaque(1))
println(opaque(1))

// Referentially Transparent

func transparent(x: Int) -> Int {
    return x + 1
}

println(transparent(1))
println(transparent(1))
println(transparent(1))
println(transparent(1))