/*
    Tail Recursion
    Functional Programming Concepts in Swift - Jake Payton
*/

// Plain old recursion - each time line 12 is hit, it needs to wait for the next iteration of recsum to complete

func recsum( #x: Int ) -> Int {
    if x == 1 {
        return x
    } else {
        return x + recsum(x: x - 1)
    }
}

recsum(x: 5)

// Tail recursion -  each time line 24 is hit, the only remaining action in the current frame is the result of tailrecsum(), so the frame can be re-used

func tailrecsum( #x: Int, runningCount : Int = 0 ) -> Int {
    if x == 0 {
        return runningCount
    } else {
        return tailrecsum(x: x - 1, runningCount: runningCount + x)
    }
}

tailrecsum(x:5)




