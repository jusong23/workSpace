//
//  ViewController.swift
//  Protocol
//
//  Created by 이주송 on 2022/04/03.
//

import UIKit

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGoNextVc(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    var delegate : ChangeLabelDelegate?
    

}

