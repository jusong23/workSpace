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
}
