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
    var userInfo: UserInfo?

    @IBOutlet weak var registerButton: UIButton!

    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupAttribute()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        // 조건 ?? 실행문 : 조건이 거짓일때만 ""를 실행한다는 뜻
        // 값이 없을 때(비어있을 때)는 "" 가 존재하게 하여 Wrapping
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    } // 입력할 때마다 호출 되는 함수
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor

        self.password = text
    }

    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 전달받아서, 그것과 textField 데이터가 일치하면
        // 로그인이 되어야한다.
        guard let userInfo = self.userInfo else {
            return
        } // Data 있으면 userInfo에 저장, 없으면 return으로 종료
        if userInfo.email == self.email, userInfo.password == self.password {
            self.loginButton.backgroundColor = .facebookColor
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            self.loginButton.backgroundColor = .disabledButtonColor
        }
    }

    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        // 화면 전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 뷰 컨트롤러를 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드를 이용해서 화면을 전환
        self.navigationController?.pushViewController(registerViewController, animated: true)
        // self.present(registerViewController, animated: true, completion: nil)
        registerViewController.userInfo = { [weak self] userInfo in self?.userInfo = userInfo }
        // ARC -> 강한참조 / 약한참조 -> ARC 낮춰줌
        // [weak self]의 유무 강,약참조 -> 메모리 해지되면 해당 line도 삭제,
        // but 안쓰면(강한참조 시키면) 뷰컨트롤러 해지 돼도 해당 line이 계속 남아있어 메모리 낭비 유발
    }



//    private func setupAttribute() {
//        // register button
//        let text1 = "계정이 없으신가요"
//        let text2 = "가입하기"
//
//        let font1 = UIFont.systemFont(ofSize: 13)
//        let font2 = UIFont.boldSystemFont(ofSize: 13)
//
//        let color1 = UIColor.darkGray
//        let color2 = UIColor.facebookColor
//
//    }
}


// 텍스트 필드에 아이디, 비밀번호 입력 했는데 로그인 버튼이 눌리긴 하지만 다음으로 안 넘어감
// 가입하기 -> 백 버튼으로 다시 돌아왔을땐 가능
