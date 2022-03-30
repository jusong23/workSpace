//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 이주송 on 2022/03/26.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties

    var isValidEamil = false {
        didSet {
            // 프로퍼티 옵저버 : 세팅이 되고 난 후 아래 코드 실행 !
            // isVaildEmail로 입력 받을 때마다 아래 메소드가 실행
            validUserInfo()
        }
    }

    var isVaildName = false {
        didSet {
            validUserInfo()
        }
    }

    var isVaildNickName = false {
        didSet {
            validUserInfo()
        }
    }

    var isVaildPassword = false {
        didSet {
            validUserInfo()
        }
    }

    // TextFields

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var signUpButton: UIButton!

    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }

    // MARK: - Lfiecyce

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }

    // MARK: - ACtion

    @objc func textFieldEditingChanged(_ sender: UITextField) {
        // sender 타입의 UITextFiled를 인수로 받겠다는 것.
        let text = sender.text ?? ""

        switch sender {
        case emailTextField:
            isValidEamil = text.isVaildEmail()
        case nameTextField:
            isVaildName = text.count > 2
        case nicknameTextField:
            isVaildNickName = text.count > 2
        case passwordTextField:
            isVaildPassword = text.isVaildPassword()
        default:
            fatalError("Missing TextField")
        }
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
           isVaildName,
           isVaildNickName,
           isVaildPassword
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
    func isVaildPassword() -> Bool {
        let regularExpression =
            "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordVaildation = NSPredicate(format: "SELF MATCHES %@", regularExpression)

        return passwordVaildation.evaluate(with: self)
    }

    func isVaildEmail() -> Bool {
        let emailRegEx =
            "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
