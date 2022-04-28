//
//  ViewController.swift
//  delegation
//
//  Created by 이주송 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var enteredLabel: UILabel!
    
//    @IBAction func aa(_ sender: Any) {
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    } // UITextFieldDelegate가 할일을 UIViewController가 위임받는 과정

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            enteredLabel.text = textField.text

            return true

        }
    
}

