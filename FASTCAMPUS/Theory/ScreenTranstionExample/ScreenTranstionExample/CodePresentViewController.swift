//
//  CodePresentViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
} //AnyObject의 상속을 받는 protocol(AnyObject에서 정의한 메소드 사용가능)


class CodePresentViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String? 
    weak var delegate: SendDataDelegate? // weak로 해야 메모리 누수 x
    // var delegate는 CodePresentVC -> VC 데이터 전송하는 역할 위임할 준비 완료
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let codePresentName = name {
            self.nameLabel.text = codePresentName
            self.nameLabel.sizeToFit()
        }
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.delegate?.sendData(name: "Gunter") // data를 send하고 dismiss로 마무리
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
