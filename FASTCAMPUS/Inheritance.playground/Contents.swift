import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling ag \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("speaker on")
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
} // Vehicle을 상속하는 Bicycle, Vehicle의 정의한 프로퍼티와 메소드를 상속받게끔함.(사용가능)

var vehicle = Vehicle()
var bicycle = Bicycle() // 변수 선언


vehicle.currentSpeed
print(vehicle.description)

bicycle.currentSpeed = 30
print(bicycle.currentSpeed)
print(bicycle.description)

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise() // superClass(Vehicle Class에서 선언된 거를 하위 클래스 들이 쓰기 편하게)
        print("CHOO CHOO")
    }
} // Vehicle을 상속하는 Train, Vehicle의 makeNoise 함수 사용 가능(override)


let train = Train()
train.makeNoise()

// ------------------

class Car: Vehicle {
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)

class AutomaticCar: Car {
    override var currentSpeed: Double{
        didSet {
            gear = Int (currentSpeed / 10) + 1
        }
    }
}

let automaticar = AutomaticCar()
automaticar.currentSpeed = 30.0
print(automaticar.description)

// superclass에 저장된 변수들을 갖고와서 조작하려면, 상속 한 다음 override로 가져와서 변수 설정 한 후에 출력하면 된다
