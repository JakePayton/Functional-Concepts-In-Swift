/*
    Map examples from Functional Programming in Swift (Eidhof, Kugler, Swierstra)
    Functional Programming Concepts in Swift - Jake Payton
*/

// Given an array of integers, increment each item in the array by 1

// regular old imperative way

func incrementArray( xs: [Int] ) -> [Int] {
    var result: [Int] = []
    for x in xs {
        result.append(x + 1)
    }
    return result
}

println(incrementArray([1, 2, 3]))

// getting better



