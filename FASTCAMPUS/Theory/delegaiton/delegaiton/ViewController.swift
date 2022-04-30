//
//  ViewController.swift
//  delegaiton
//
//  Created by 이주송 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func button(_ sender: Any) {
        textFieldShouldReturn(textField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label.text = textField.text
        return true
    }

}
