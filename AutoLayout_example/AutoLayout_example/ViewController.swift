//
//  ViewController.swift
//  AutoLayout_example
//
//  Created by 이주송 on 2022/04/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("it`s work")
    }
    
}

