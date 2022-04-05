//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 이주송 on 2022/04/04.
// 4월 5일 화
import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""

    var userInfo: ((UserInfo) -> Void)?

    var isValidEamil = false {
        didSet {
            // 프로퍼티 옵저버 : 세팅이 되고 난 후 아래 코드 실행 !
            // isValidEmail로 입력 받을 때마다 아래 메소드가 실행
            self.validUserInfo()
        }
    }

    var isValidName = false {
        didSet {
            self.validUserInfo()
        }
    }

    var isValidNickname = false {
        didSet {
            self.validUserInfo()
        }
    }

    var isValidPassword = false {
        didSet {
            self.validUserInfo()
        }
    }
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }

    // TextFields
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
   
    // MARK: - Lfiecyce


    // MARK: - ACtion
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        // sender 타입의 UITextFiled를 인수로 받겠다는 것.
        let text = sender.text ?? ""

        switch sender {
        case emailTextField:
            self.isValidEamil = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField")
        }
        // in textFieldEditingChanged
        print(email)
    }

    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func registerButtonDidTap(_ sender: UIButton) {

        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password
        )
        self.userInfo?(userInfo)
        self.navigationController?.popViewController(animated: true)
        //in registerButtonDidTap
        print(email)
    }

    // MARK: - Helpers
    private func setupTextField() {
        textFields.forEach {
            txfd in txfd.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }

    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validUserInfo() {
        if isValidEamil,
           isValidName,
           isValidNickname,
           isValidPassword
        {
            signUpButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor =
                    UIColor.facebookColor
            }

        } else {
            signUpButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signUpButton.backgroundColor =
                    .disabledButtonColor
            }
        }
    }
}

// 정규표현식
extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일 때 -> true
    func isValidPassword() -> Bool {
        let regularExpression =
            "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-zu\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate(format: "SELF MATCHES %@", regularExpression)

        return passwordValidation.evaluate(with: self)
    }

    func isValidEmail() -> Bool {
        let emailRegEx =
            "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
