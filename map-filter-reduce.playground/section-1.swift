/*
  Using Map, Filter, and Reduce - Examples from Ash Furrow (Author of Functional Reactive Programming with Reactive Cocoa)
  Functional Programming concepts in Swift
*/

import Foundation

/////////////////////////////////////
// SORT - func sorted(isOrderedBefore: (T, T) -> Bool) -> [T]
/////////////////////////////////////

let unsortedNumbers = [20, 1, 2, 7, 4, 9, 16, 21, 25, 5, 13, 8, 3]
print(unsortedNumbers)

/////////////////////////////////////
// sorted function of array takes a trailing closure that defines how to sort
/////////////////////////////////////

let sortedNumbers = unsortedNumbers.sorted { ( left , right ) -> Bool in return left < right }
print(sortedNumbers)

/////////////////////////////////////
// We can also use the < operator function and let swift infer what we want
/////////////////////////////////////

let sortedBySuperAwesomeInference = unsortedNumbers.sorted(<)
print(sortedBySuperAwesomeInference)


/////////////////////////////////////
// FILTER
/////////////////////////////////////


func isEven( number: Int ) -> Bool {
    return number % 2 == 0
}

/////////////////////////////////////
// filter lets us remove items from the array by using a closure to define
/////////////////////////////////////

let filteredEvenNumbers = unsortedNumbers.filter { (i) -> Bool in return isEven(i) }
print(filteredEvenNumbers)

/////////////////////////////////////
// We can even chain these things together, first filter out odd numbers and then sort the result
/////////////////////////////////////

let sortedEvenNumbers = unsortedNumbers.sorted(<).filter(isEven)
print(sortedEvenNumbers)




/////////////////////////////////////
// IMPERATIVE vs FUNCTIONAL EXAMPLES with Structs in an Array using Map, Filter, Reduce
/////////////////////////////////////

struct Person {
    let name: String
    let birthdate: NSDate
}

let family = [
    Person(name: "Jake", birthdate: NSDate(timeIntervalSinceReferenceDate: -732895200)),
    Person(name: "Elise", birthdate: NSDate(timeIntervalSinceReferenceDate: -773416800)),
    Person(name: "Chase", birthdate: NSDate(timeIntervalSinceReferenceDate: 360583200)),
    Person(name: "Fake Baby", birthdate: NSDate(timeIntervalSinceReferenceDate: 441838897))  // Fake Baby New Year will help later
]

/////////////////////////////////////
// Get the names of everyone in family, the imperative way with a mutating array
/////////////////////////////////////

func getFamilyNames_Imperatively(people: [Person]) -> [String] {
    var results = [String]()
    for person in people {
        results.append(person.name)
    }
    return results
}

getFamilyNames_Imperatively(family)


/////////////////////////////////////
// Get the names of everyone in family, the functional way with map() and a trailing closure
/////////////////////////////////////

func getFamilyNames_Functionally(people: [Person]) -> [String] {
    return people.map { $0.name }
}

getFamilyNames_Functionally(family)



/////////////////////////////////////
// Get everyone in our family that hasn't celebrated a birthday yet this year
/////////////////////////////////////

func getPeopleStillLeftToCelebrateBirthday_Imperatively(people: [Person]) -> [Person] {
    let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    let currentDay = calendar.ordinalityOfUnit( NSCalendarUnit.CalendarUnitDay, inUnit: NSCalendarUnit.CalendarUnitYear, forDate: NSDate())
    
    var results = [Person]()
    for person in people {
        let birthdayDay = calendar.ordinalityOfUnit( NSCalendarUnit.CalendarUnitDay, inUnit: NSCalendarUnit.CalendarUnitYear, forDate: person.birthdate )
        if birthdayDay >= currentDay {
            results.append(person)
        }
    }
    
    return results
}

getPeopleStillLeftToCelebrateBirthday_Imperatively(family)

/////////////////////////////////////
/// What about a functional approach with Filter and a nested function that seperates the concern of celebratedBirthdayYet
/////////////////////////////////////

func getPeopleStillLeftToCelebrateBirthday_Functionally(people: [Person]) -> [Person] {
    let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    let currentDay = calendar.ordinalityOfUnit( NSCalendarUnit.CalendarUnitDay, inUnit: NSCalendarUnit.CalendarUnitYear, forDate: NSDate())
    
    func celebratedBirthdayYet(person: Person) -> Bool {
        let birthdayDay = calendar.ordinalityOfUnit(NSCalendarUnit.CalendarUnitDay, inUnit: NSCalendarUnit.CalendarUnitYear, forDate: person.birthdate)
        return birthdayDay >= currentDay
    }
    
    return people.filter(celebratedBirthdayYet)
}

getPeopleStillLeftToCelebrateBirthday_Functionally(family)

// Just names: getFamilyNames_Functionally( getPeopleStillLeftToCelebrateBirthday_Functionally(family) )


/////////////////////////////////////
/// How about getting the oldest person in the family the imperative way ... my wife will kill me for using her real birthday 💩
/////////////////////////////////////

func getOldestPerson_Imperatively(people: [Person]) -> Person? {
    var oldestPersonSoFar = people.first
    
    for person in people {
        if oldestPersonSoFar!.birthdate.compare(person.birthdate) == NSComparisonResult.OrderedDescending {
            oldestPersonSoFar = person
        }
    }
    
    return oldestPersonSoFar
}

getOldestPerson_Imperatively(family)

/////////////////////////////////////
///  What about a functional approach that uses a nested function and reduce
/////////////////////////////////////

func getOldestPerson_Functionally(people: [Person]) -> Person? {
    func olderPerson(left: Person!, right: Person) -> Person {
        if left.birthdate.compare(right.birthdate) == NSComparisonResult.OrderedAscending {
            return left
        } else {
            return right
        }
    }
    
    return people.reduce(people.first, combine: olderPerson)
}

getOldestPerson_Functionally(family)

/* 
This function uses reduce, another useful, but somewhat confusing function. reduce (sometimes called "fold") can be thought of like a way to iterate over your entire array. At each invocation, the combine closure is invoked and passed in the result of the last combine invocation, or the first parameter to reduce if combine hasn't been invoked yet.

reduce is useful for choosing one element out of a long list. However, its uses extend far beyond just choosing values. It can be used for all sorts of things. Take summing up our numbers from earlier, for example using the + operator function and swift's inference.
*/

unsortedNumbers.reduce(0, combine: +)



