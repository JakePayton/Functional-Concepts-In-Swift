/*
    Tail Recursion
    Functional Programming Concepts in Swift - Jake Payton
*/

// Plain old recursion

func recsum( #x: Int ) -> Int {
    if x == 1 {
        return x
    } else {
        return x + recsum(x: x - 1)
    }
}

recsum(x: 5)

/* compiler did this

recsum(x: 5)
5 + recsum(x: 4)
5 + ( 4 + recsum(x: 3))
5 + ( 4 + ( 3 + recsum(x: 2)))
5 + ( 4 + ( 3 + ( 2 + recsum(x: 1))))
5 + ( 4 + ( 3 + ( 2 + 1)))
15

*/

// Tail recursion

func tailrecsum( #x: [Int], _ total: Int = 0) -> Int {
    if let head = numbers.first {
        let tail = Array(dropFirst(numbers))
        return sumRecursively(tail, head + total)
    } else {
        return total
    }
}

let myNumbers = [1,2,3,4,5]
sumRecursively(myNumbers)
