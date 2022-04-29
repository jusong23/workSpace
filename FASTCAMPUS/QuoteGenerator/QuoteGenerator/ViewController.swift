//
//  ViewController.swift
//  QuoteGenerator
//
//  Created by 이주송 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
    Quote(contents: "명언1", name: "이름1"),
    Quote(contents: "명언2", name: "이름2"),
    Quote(contents: "명언3", name: "이름3"),
    Quote(contents: "명언4", name: "이름4"),
    Quote(contents: "명언5", name: "이름5"),
    ] // 구조체 파일(swift)에 선언된 struct instance의 저장 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapQuoteGenerator(_ sender: Any) {
        let random = Int(arc4random_uniform(5)) // 0~4 사이의 난수를 발생
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
}

// 저장 프로퍼티 , 휴깅, 컴프레션 레지스턴스, 난수발생
