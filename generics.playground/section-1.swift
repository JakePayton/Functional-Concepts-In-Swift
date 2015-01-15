/*
  Basic Generics Example
  Functional Programming Concepts in Swift
*/

func swapTwoThings <SomeType> ( inout a: SomeType, inout b : SomeType ){
    (a,b) = (b,a)
}

var a = 1
var b = 2

println("\(a) \(b)")
swapTwoThings(&a, &b)
println("\(a) \(b)")

var otherA = "Jake"
var otherB = "Payton"

println("\(otherA) \(otherB)")
swapTwoThings(&otherA, &otherB)
println("\(otherA) \(otherB)")

