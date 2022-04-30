//
//  CodePushViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

class CodePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    // data를 전달받은 변수 설정(단, 전달받지 않을때도 설정해두면 메모리낭비! -> 옵셔널
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let codePushName = name {
            self.nameLabel.text = codePushName
            self.nameLabel.sizeToFit()
        }
    }
    // data 받을 변수(name)를 옵셔널 바인딩 해주는 작업
    // if let name = name 이렇게 써주는게 가독성 더 좋음


    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
