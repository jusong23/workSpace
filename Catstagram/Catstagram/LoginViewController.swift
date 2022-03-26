//
//  LoginViewController.swift
//  Catstagram
//
//  Created by 이주송 on 2022/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    @IBAction func TextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        // 조건 ?? 실행문 : 조건이 거짓일때만 ""를 실행한다는 뜻
        // 값이 없을 때(비어있을 때)는 "" 가 존재하게 하여 Wrapping
        email = text
    } // 입력할 때마다 호출 되는 함수

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        password = text
    }

    @IBAction func loginButtonDidTap(_: UIButton) {}

    @IBAction func registerButtonDidtap(_: UIButton) {
        // 화면 전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰 컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드를 이용해서 화면을 전환
        navigationController?.pushViewController(registerViewController, animated: true)
//        self.present(registerViewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
