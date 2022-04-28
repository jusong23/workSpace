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
    Quote(contents: "명언2", name: "이름2")
    ] // 구조체 파일(swift)에 선언된 struct instance의 저장 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapQuoteGenerator(_ sender: Any) {
        
    }
    
}

// 저장 프로퍼티 , 휴깅, 컴프레션 레지스턴스,
