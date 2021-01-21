//
//  Global.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

var ratio: CGFloat = 0
var isBigPhone = false
var topSafeMargin: CGFloat = 0
var phoneWidth: CGFloat = 0

struct Frame {
    var number: Int
    var points = [Point.idle, Point.idle, Point.idle]
    var score = 0
    var cumulativeScore = 0
}

struct BonusPoint {
    var type: Point
    var frame = 0
    var count = 0
}

enum Point: Int {
    case idle = -1
    case miss = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case strike = 10
    case spare = 11
}

func pointToString(_ point: Point) -> String {
    switch point {
    case .idle:
        return "N/A"
    case .miss:
        return "-"
    case .strike:
        return "X"
    case .spare:
        return "/"
    default:
        return String(point.rawValue)
    }
}

struct History {
    let players: [String]
    let colors: [UIColor]
    let scores: [Int]
}
