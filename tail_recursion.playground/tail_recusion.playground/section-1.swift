/*
  Tail Recursion
  Functional Programming Concepts in Swift - Jake Payton
*/

// Plain old recursion

func recsum( x: Int ) -> Int {
    if x == 1 {
        return x
    } else {
        return x + recsum( x - 1 )
    }
}

recsum(5)

/* compiler did this

recsum(5)
5 + recsum(4)
5 + (4 + recsum(3))
5 + (4 + (3 + recsum(2)))
5 + (4 + (3 + (2 + recsum(1))))
5 + (4 + (3 + (2 + 1)))
15

*/

// Tail recursion

func tailrecsum( #x: Int, running_total : Int = 0) -> Int {

    if x == 0 {
        return running_total
    } else {
        return tailrecsum(x: x - 1, running_total: running_total + x )
    }
}

tailrecsum(x: 5)

/* compiler did this

tailrecsum(5, 0)
tailrecsum(4, 5)
tailrecsum(3, 9)
tailrecsum(2, 12)
tailrecsum(1, 14)
tailrecsum(0, 15)
15


*/