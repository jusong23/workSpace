//
//  ViewController2.swift
//  Recap_LEDBoard
//
//  Created by 이주송 on 2022/05/02.
//  it`s work?

import UIKit

class ViewController: UIViewController,RandomSettingDelegate {
    func changeSetting(text: String?, textColor: UIColor) {
        if let text = text {
            self.labelName.text = text
        }; self.labelName.textColor = textColor
    }
    

    @IBOutlet weak var labelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.sizeToFit()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as?
            SettingViewController {
            settingViewController.delegate = self
            settingViewController.randomedText = self.labelName.text
            settingViewController.backgroundColor = self.labelName.textColor ?? .black
            settingViewController.textColor = self.labelName.textColor ?? .black
            // 현재 labelName의 text와 textColor를 settingVC의 backgroundColor, textColor에
            // 저장할것이고, 이들은 settingVC 내부에서 초기화 되어야 mainVC(옵셔널 바인딩)에서 넘길수 있는 것이다.
        }
    }
}
