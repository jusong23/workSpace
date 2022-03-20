//
//  ViewController.swift
//  OddOrEvenGame
//
//  Re_Created by 이주송 on 2022/3/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var computerBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!

    var comBallsCount: Int = 20
    var userBallsCount: Int = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
    }

    @IBAction func gameStartPressed(_: Any) {
        print("게임시작!! ")
    }
}
