import UIKit


let hello = { () -> () in
    print("hello")
}

hello()

let hello2 = {
    (name: String) -> String in
    return "HELLO, \(name)"
}

hello2("JUSONG")
// 만약 함수처럼 hello2(name: "JUSONG") 전달인자 label하면 오류

// 함수의 parameter type으로 closure을 전달할 수 있다.(일급객체의 특징)
func doSomething(closure: () -> () ){
    closure()
} // doSomething 함수가 호출되면 closure가 호출되게! - 함수의 인자로 Closure을 받을 수 있다.

doSomething(closure: { () -> () in
    print("HELLO ClOUSURE")
})// 함수의 반환 값으로 Closure가 될 수 있다.

doSomething() {
    print("hello2")
}


func doSomething2() -> () -> () {
    return{ () -> () in
        print("Hello4")
    }
}

doSomething2()()


// -----------



