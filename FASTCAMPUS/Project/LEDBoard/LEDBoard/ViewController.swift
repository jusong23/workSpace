//
//  ViewController.swift
//  LEDBoard
//
//  Created by 이주송 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }


}

