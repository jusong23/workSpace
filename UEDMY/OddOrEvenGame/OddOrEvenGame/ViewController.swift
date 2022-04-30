//
//  ViewController.swift
//  OddOrEvenGame
//
//  Re_Created by 이주송 on 2022/3/20.
//

// 1. 컴퓨터가 1에서 10까지의 랜덤으로 숫자를 선택
// 2. 사용자는 가진 구슬 개수를 걸고 홀짝 중에 하나를 선택한다.
// 3. 결과 값이 화면에 보여진다.
// * 내가 내놓은 수의 구슬과 , 컴퓨터의 구슬의 합의 홀짝 여부를 맞추면 다 가져가는거, 틀리면 다 뺏기는 거

import UIKit

class ViewController: UIViewController {
    @IBOutlet var computerBallCountLbl: UILabel!
    @IBOutlet var userBallCountLbl: UILabel!

    @IBOutlet var resultLbl: UILabel!
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
    }

    @IBAction func gameStartPressed(_: Any) {
        print("게임시작!! ")

        let alert = UIAlertController(title: "Game Start", message: "홀짝을 선택해주세요", preferredStyle: .alert)

        let oddBtn = UIAlertAction(title: "홀", style: .default) { _ in
            print("홀수 버튼을 클릭했습니다.")
            guard let input = alert.textFields?.first?.text, let value = Int(input)
            else { return }
            // guard : 참이면 그냥 지나가고 거짓이면 (아무것도 저장 되지 않으면) else 문이 실행 (return 할 것이라는 뜻)
            print("입력한 값은 \(input)입니다.")
            self.getWinner(count: value, select: "홀")
        }

        let evenBtn = UIAlertAction(title: "짝", style: .default) { _ in
            print("짝수 버튼을 클릭했습니다.")
            guard let input = alert.textFields?.first?.text, let value = Int(input) else { return }
            print("입력한 값은 \(input)입니다.")
            self.getWinner(count: value, select: "짝")
        }

        alert.addTextField { textFiled in
            textFiled.placeholder = "세팅할 구슬의 갯수를 입력해주세요"
        }

        alert.addAction(oddBtn)
        alert.addAction(evenBtn)

        // let alert : UIAlertController로 하여금 창 만을 띄운다. (이때 창에다 쓸 attribute들은 title, message,preferredStyle에 적는다.
        // let okayBtn : UIAlertAction 버튼을 클릭했을때 양식을 보낸다

        present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        } // alert 됐을때 나타날 수 있는 표시 속성
    }

    func getWinner(count: Int, select: String) {
        let com = getRandom()
        let comType = (com + count) % 2 == 0 ? "짝" : "홀"
        var result = comType
        if comType == select {
            print("User Win")
            result = result + " User Win"
            calculateBalls(winner: "user", count: count + com)
        } else {
            print("Computer Win")
            result = result + " Computer Win"
            calculateBalls(winner: "com", count: count + com)
        }
        resultLbl.text = result
        print("컴퓨터의 구슬은 \(com)개,나의 구슬은 \(count)개")
        print("총 합은 \(com + count) 개 이고 나는 \(select)수를 골랐고, \(comType)수 이므로")
        print("\(result)")
    }

    func calculateBalls(winner: String, count: Int) {
        if winner == "com" {
            userBallsCount = userBallsCount - count
            comBallsCount = comBallsCount + count
        } else { userBallsCount = userBallsCount + count
            comBallsCount = comBallsCount - count
        }
        computerBallCountLbl.text = "\(comBallsCount)"
        userBallCountLbl.text = "\(userBallsCount)"
    }

    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1) // 10을 넣으면 0~9 까지 , +1 했으니 1에서 10까지 ! and 소수점나오니 Int 로 Typecasting 해줌 !
    }
}
