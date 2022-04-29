//
//  CodePresentViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
