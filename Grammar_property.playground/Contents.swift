import UIKit
//
// struct Student {
//    var name: String
//    var age: Int
// }

// var jason = Student(name: "jason", age: 24)

print(jason)

struct WeeklySalary {
    var hourlyWage: Double
    var workingHours: Double

    var wage: Double {
        get {
            return hourlyWage * workingHours
        }
        set {
            workingHours = newValue / hourlyWage
        }
    }
}

// get : houlyWage, workingHours 에 값을대입하면 연산하여 'return' 해내는 연산 프로퍼티
// set : wage에 new 값을 대입하면 새로운 workingHours를 저장해내는 연산 프로퍼티

var myWeeklySalary = WeeklySalary(hourlyWage: 10000, workingHours: 5)
print(myWeeklySalary.wage)
myWeeklySalary.wage = 60000
print(myWeeklySalary.workingHours)

struct Student {
    var name: String {
        willSet {
            print("\(name)에서 -> \(newValue)로 변경예정") // 실행 전 name(주송)으로 실행
        }
        didSet {
            print("\(oldValue)에서 -> \(name)로 변경 됨") // 실행 후 name(무니)로 실행
        }
    }
}

var jason = Student(name: "주송")
jason.name = "무니"
// 변수 선언 후 , jason.name 에 넣을 때 마다 다른 값으로 실행 됨

struct SomeStruct {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}
SomeStruct.storedTypeProperty
SomeStruct.computedTypeProperty
// 타입 프로퍼티를 선언하는 과정
print("\(SomeStruct.storedTypeProperty)") // print문 안에, "" 을 써주되, 변수 값을 써주려면 \(@@) 안에 넣어줘야 ! 
print("\(SomeStruct.computedTypeProperty)")

