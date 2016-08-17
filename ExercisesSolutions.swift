//
//  ExercisesSolutions.swift
//  
//
//  Created by Luis Costa on 17/08/16.
//
//

import Foundation

func calculator(a: Int, b: Int) -> Int {
    return a + b
}

// 1. Call calculator() function with 1 and 2
let ex1 = calculator(1, b: 2)

// 2. Change calculator to return both a + b and a * b
func newCalculator(a: Int, b: Int) -> (Int, Int) {
    return (a + b, a * b)
}
let ex2 = newCalculator(2, b: 4)
print(ex2)

// 3. Call arrayPrinter with an array with a printer function that greets the value it receives (for example, "Moshe" will return "Hello, Moshe!")
func arrayPrinter(array: [String], printer: String -> String) {
    for a in array {
        print(printer(a))
    }
}

func printFunc (name: String) -> String {
    return "Hello, \(name)"
}
let ex3 = ["Luke", "C3PO", "R2D2", "Han"]
arrayPrinter(ex3, printer: printFunc)

// 4. Create an incrementer function. It receives a number (incrementAmount) and then returns a function that receives a number (x) and returns x + incrementAmount
// For example:
// let tenIncrementer = incrementer(10)
// tenIncrementer(10) returns 20
// tenIncrementer(3) returns 13
func incrementer(incAmount: Int) -> (Int -> Int) {
    // $0 refers to the argument
    // or {x in return incAmount + x}
    return {return incAmount + $0}
}
let tenIncrementor = incrementer(10)
print(tenIncrementor(10))
print(tenIncrementor(3))


// 5. Use the map function on this array to create an array of Strings. Use trailing closure syntax:
let numbers = [1, 2, 3, 4, 5]
// ex5 = numbers.map({x in return String(x)})
// more simple
let ex5 = numbers.map{String($0)}
print(ex5)

// 6. Write an intMap function that receives [Int] and a closure to change the value of each int in the array to a different int
func intMap(array: [Int], closure: Int -> Int) -> [Int] {
    return array.map(closure)
}

// Uncomment the following line to make sure your implementation of intMap works:
// let results = intMap([1, 2, 3, 4]) { $0 * $0 }
// print(results)

// 7. Create a function called memorize() that receives a function of type Int -> Int, and returns memorized
// version of it
func memorize(f: Int -> Int) -> (Int -> Int) {
    return f
}
let doubleFuncion = memorize{$0 * 2}

// 8. Write a function called logger that takes a closure and runs it, but logs before and after that function is run.
// For example: logger("myFunc") { println("I ran!") } should print:
// [*] Running myFunc
// I ran!
// [*] myFunc done
func logger(funcName: String, closure: () -> ()) {
    print("[*] Running \(funcName)")
    closure()
    print("[*] \(funcName) done")
}
logger("my function", closure: {print("Hello World!")})


// 9. Create an enum of the days of the week, with appropriate raw values
enum WeekDay: Int {
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}
let x = WeekDay.init(rawValue: 4)

// 10. Create enum of TimeUnit with values Second, Minute, Hour, Day and Week.
// Add a method for converting between them. e.g. TimeUnit.Day.convertTo(TimeUnit.Hour) == 24.0
enum TimeUnit: Double {
    case Second = 1
    case Minute = 60
    case Hour = 3600
    case Day = 86400
    case Week = 604800
    
    func convertTo(unit: TimeUnit) -> Double {
        let this = self.rawValue
        let other = unit.rawValue
        
        return this / other
    }
}
let daysInAWeek = TimeUnit.Day.convertTo(TimeUnit.Hour)
let weekInADays = TimeUnit.Day.convertTo(TimeUnit.Week)
let minuteToSeconds = TimeUnit.Minute.convertTo(TimeUnit.Second)
let secondToMinute = TimeUnit.Second.convertTo(TimeUnit.Minute)

