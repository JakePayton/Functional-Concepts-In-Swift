/*

    Tail Recursion Example by Marcelo Fabri - https://gist.github.com/marcelofabri/4b41adb87a09ce86ff40

    Functional Programming Concepts in Swift - Jake Payton

*/


func sumRecursively(numbers: [Int], _ total: Int = 0) -> Int {
    if let head = numbers.first {
        let tail = Array(dropFirst(numbers))
        return sumRecursively(tail, head + total)
    } else {
        return total
    }
}

let myNumbers = [1,2,3,4,5]
sumRecursively(myNumbers)