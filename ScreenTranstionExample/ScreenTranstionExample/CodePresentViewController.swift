//
//  CodePresentViewController.swift
//  ScreenTranstionExample
//
//  Created by 이주송 on 2022/04/29.
//

import UIKit

class CodePresentViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String? 

    override func viewDidLoad() {
        super.viewDidLoad()
        if let codePresentName = name {
            self.nameLabel.text = codePresentName
        }
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
