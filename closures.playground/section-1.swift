/*
  Closures Examples - from Apple's Programming in Swift
  Functional programming concepts in Swift
*/

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// passing a named function as a closure

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed = sorted(names, backwards)

// using an anonymous closure

reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 })
println(reversed)

// using type inference

reversed = sorted(names, { s1, s2 in return s1 > s2 } )
println(reversed)

// Implicit return

reversed = sorted(names, { s1, s2 in s1 > s2 } )
println(reversed)

// shorthand argument names

reversed = sorted(names, { $0 > $1 } )
println(reversed)

// Trailing syntax






