/*
  Using Map, Filter, and Reduce - Examples from Ash Furrow
  Functional Programming concepts in Swift
*/

import Foundation

let unsortedNumbers = [1, 2, 7, 9, 21, 25, 5, 13, 8, 3]
println(unsortedNumbers)

// sorted function of array takes a trailing closure that defines how to sort

let sortedNumbers = unsortedNumbers.sorted { ( left , right ) -> Bool in return left < right }
println(sortedNumbers)

// We can also use 
let sortedBySuperAwesomeInference = unsortedNumbers.sorted(<)
println(sortedBySuperAwesomeInference)

