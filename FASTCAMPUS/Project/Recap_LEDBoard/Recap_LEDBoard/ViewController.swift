//
//  ViewController.swift
//  Recap_LEDBoard
//
//  Created by 이주송 on 2022/05/01.
//

import UIKit

class SettingViewController: UIViewController {
//    let randomColor = [UIColor.red, UIColor.black, UIColor.blue]
//    let randomColorName = ["red", "black", "blue"]

    let randoms = [
        randomContents(Color: .red, name: "red"),
        randomContents(Color: .black, name: "black"),
        randomContents(Color: .blue, name: "blue")
    ]
    
    
    @IBOutlet weak var selectedColorName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var randomColorView: UIView!
    
    @IBAction func randomColorButton(_ sender: UIButton){
        let randomNumber = Int(arc4random_uniform(3))
        let random = randoms[randomNumber]
        
        self.randomColorView.backgroundColor = random.Color
        self.selectedColorName.text = random.name
        self.selectedColorName.textColor = random.Color
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

