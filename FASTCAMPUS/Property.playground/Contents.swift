import UIKit

//protocol SomeProtoclol {
//
//}
//protocol SomeProtoclol2 {
//
//}
//
//
//struct SomeStructure: SomeProtoclol, SomeProtocol2 {
//
//} // struct 에서 protocol 채택
//// 상속, struct - class, property

struct Dog {
    var name: String
    let gender: String
}

var dog = Dog(name: "gunter", gender: "Male") // 변수로 선언된
print(dog)

dog.name = "JUSONG"
print(dog)

let dog2 = Dog(name: "gunter", gender: "Male") // 상수로 선언된 struct 인스턴스의 저장프로퍼티
print(dog2)

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender:String) {
        self.name = name
        self.gender = name
    }
}

let cat = Cat(name: "json", gender: "male")
cat.name = "gunter"
print(cat.name) // but class는 참조 타입이기 때문에 상수(let)으로 선언해도 이렇게 바꿀수 있음(struct는 value 타입)


struct Stock {
    var averagePrice: Int
    var quanity: Int
    var purchasePricd: Int {
        get {
            return averagePrice * quanity
        }
        
        set(newPrice) {
            averagePrice = newPrice / quanity
        }
    }
}

var stock = Stock(averagePrice: 2300, quanity: 3)
stock.purchasePricd = 3000 // 연산 프로퍼티 purchasePricd는 instance 내 외의 값을 연산해서 돌려주는 접근자 역할.
                           // 내부 프로퍼티 값을 설정하는 설정자 역할 (겟만 사용하면 읽기 전용 프로퍼티 !)
stock.averagePrice
// -----------------

