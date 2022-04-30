//
//  ViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit


class ViewController: UIViewController, SendDataDelegate{

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC 뷰가 로드되었다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC 뷰가 나타날 것이다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC 뷰가 나타났다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC 뷰가 사라질 것이다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC 뷰가 사라졌다.")
    }
    
    
    

    @IBAction func tapCodePushButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else { return }
        // 따옴 캐스팅 as? 뒤에 정의한 VC의 변수(var name)에 접근가능
        viewController.name = "Gunter"
            self.navigationController?.pushViewController(viewController, animated: true)
    } // storu보드에 있는 VC를 인스턴스화 시켜줘야
    
    @IBAction func tapPresentButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else {return}
        // 따옴 캐스팅 as? 뒤에 정의한 VC의 변수(var name)에 접근가능
        viewController.modalPresentationStyle = .fullScreen
        // 기본적인 모달형식(밑에서 올라오지만 꽉 차지 않음)을 Fullscreen으로 변경 !
        viewController.name = "Gunter"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Gunter_Push"
        } // 전달하려는 SeguePushVC를 따옴캐스팅, 데이터 전송
        
        else if let viewController = segue.destination as? SeguePresentViewController {
            viewController.name = "Gunter_Present"
        }
    }

    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

