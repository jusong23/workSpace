//
//  ViewController.swift
//  protocol_2
//
//  Created by 이주송 on 2022/04/03.
//

import UIKit

protocol Flyable {
    func fly()
} // 1.Protocol을 통해 기능 구현

protocol Runnable {
    func run ()
}

class Person : Flyable, Runnable{
    // 2.Delegate를 통해 기능 위임
    func fly() {
        print("날았다.")
    };
    func run() {
        print("뛰었다.")
    }
}

class ViewController: UIViewController {

    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person.fly()
        person.run()
        // 3.위임 받은 Object에서 Protocol 사용
    }


}

