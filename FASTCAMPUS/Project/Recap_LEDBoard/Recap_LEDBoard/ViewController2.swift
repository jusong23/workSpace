//
//  ViewController2.swift
//  Recap_LEDBoard
//
//  Created by 이주송 on 2022/05/02.
//  it`s work?

import UIKit

class ViewController2: UIViewController,RandomSettingDelegate {
    func changeSetting(text: String?, textColor: UIColor) {
        if let text = text {
            self.labelName.text = text
        }; self.labelName.textColor = textColor
    }
    

    @IBOutlet weak var labelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as?
            SettingViewController {
            settingViewController.delegate = self
        }
    }
}
