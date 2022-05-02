//
//  ViewController.swift
//  Recap_LEDBoard
//
//  Created by 이주송 on 2022/05/01.
//

import UIKit

protocol RandomSettingDelegate: AnyObject{
    func changeSetting(text: String?, textColor: UIColor)
}

class SettingViewController: UIViewController {

    let randoms = [
        randomContents(Color: .red, name: "red"),
        randomContents(Color: .black, name: "black"),
        randomContents(Color: .blue, name: "blue")
    ]
    
    @IBOutlet weak var selectedColorName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var randomColorView: UIView!
    
    weak var delegate: RandomSettingDelegate?
    
    @IBAction func randomColorButton(_ sender: UIButton){
        let randomNumber = Int(arc4random_uniform(3))
        let random = randoms[randomNumber]
        
        self.randomColorView.backgroundColor = random.Color
        self.selectedColorName.text = random.name
        self.selectedColorName.textColor = random.Color
    }
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changeSetting(
            text: self.textField.text,
            textColor: self.randomColorView.backgroundColor ?? .black)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

