import UIKit

protocol SomeProtocol {
    
}

protocol SomeProtocol2 {
    
}

struct SomeStructure: SomeProtocol,SomeProtocol2 {
    
} // SomeStructure이라는 구조체에 SomeProtocol이 채택됨


protocol FirstProtocol {
    var name: Int { get set } // 읽기 쓰기 가능
    var age: Int { get } // 읽기 전용
} // FirstProtocol이라는 Protocol 안에 name과 age라는 프로퍼티가 생성되어있음

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
} // 프로토콜안에서 타입 프로퍼티를 요구해야 할때 static keyword를 작성해줘야 함

protocol FullyNames {
    var fullName: String { get set }
    func printFullName()
}

struct Person: FullyNames {
    var fullName: String
    
    func printFullName() {
        print(fullName)
    }
    
} // FullyNames이라는 프로토콜을 채택하려면 FullyNames이라는 프로토콜이 요구하는 사항(var fullName: String)을 모두 충족해야 한다.
// = Person struct conform FullyNames protocol
 
protocol SomeProtocol5 {
    init()
} // 생성자 요구사항 : Init(), 이 프로토콜을 채택하는 이 요구사항을 만족해야 한다.

class SomeClass: SomeProtocol5 {
    required init() {
    }
} // class 에서는 다음과 같이 required 식별자 필요함

// ---- EXAMPLE

protocol Student {
    var height: Double{ get set }
    var name: String{ get }
    static var schoolNumber: Int { get set }
}

class Aiden: Student {
    var roundingHeight: Double = 0.0
    var height: Double {
        get {
            return roundingHeight
        }
        set {
            roundingHeight = 183.0
        }
    }
    var name: String = "Aiden"
    static var schoolNumber: Int = 2018734021
}

let aiden = Aiden()
print(aiden.height, aiden.name, Aiden.schoolNumber)
aiden.height = 183.0
print(aiden.height, aiden.name, Aiden.schoolNumber)

