//
//  ViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapCodePushButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
    } // storu보드에 있는 VC를 인스턴스화 시켜줘야
    
    @IBAction func tapPresentButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") else {return}
        viewController.modalPresentationStyle = .fullScreen // 기본적인 모달형식(밑에서 올라오지만 꽉 차지 않음)을 Fullscreen으로 변경 !
        self.present(viewController, animated: true, completion: nil)
    }
    
    
}

