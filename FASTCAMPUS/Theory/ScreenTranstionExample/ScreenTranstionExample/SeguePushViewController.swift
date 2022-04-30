//
//  SeguePushViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

class SeguePushViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SeguePush VC 뷰가 로드되었다.")
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePush VC 뷰가 나타날 것이다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePush VC 뷰가 나타났다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SeguePush VC 뷰가 사라질 것이다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SeguePush VC 뷰가 사라졌다.")
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
