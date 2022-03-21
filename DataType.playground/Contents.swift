import Foundation
import UIKit

var isChecked = false

if isChecked {
    print("체크되어 있슴")
} else {
    print("체크 안돼써")
}

var time = 10
if time == 9 {
    print("저녁먹을 시간")
} else if time == 12 {
    print("점심먹을 시간")
} else { print("자유시간")
}

func getName(name: String?) -> String {
    guard let uName = name else {
        return "이름값이 존재하지 않습니다"
    }
    return uName
}

getName(name: "Jason")
getName(name: nil)
