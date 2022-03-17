import UIKit

var greeting = "Hello, playground"
var name: String = "Atlas"
var age: Int = 20

name
name = "아틀라스"

age
age = 30

func sayHello(name: String, age: Int) -> String {
    return "Nice to meet you \(name), I`m a \(age) years old"
}

sayHello(name: name, age: age)

func multpiler(a: Int, b: Int) -> Int {
    return a * b
}

multpiler(a: 6, b: 2)
