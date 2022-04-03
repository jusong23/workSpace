//
//  SecondViewController.swift
//  Protocol
//
//  Created by 이주송 on 2022/04/03.
//

import UIKit


class SecondViewController: UIViewController,ChangeLabelDelegate {
    
    
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    
    
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true,completion: nil)
        // 화면 없애는 메소드
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
