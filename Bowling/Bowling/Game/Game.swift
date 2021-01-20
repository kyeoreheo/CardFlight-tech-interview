//
//  Game.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import Foundation

class Game {
    public var board = [Frame]()
    
    private(set) var currentFrame = 0
    private(set) var currentTrial = 0
    private var bonusPointQueue = Array<BonusPoint>()
    
    init() {
        for i in 1...10 {
            self.board.append(Frame(number: i))
        }
    }
    
    public func addPoint(of point: Point) {
        var tempPoint = point
        let maxTrial = currentFrame < board.count - 1 ? 1 : 2

        if isSpare(when: point) {
            tempPoint = Point(rawValue: 10 - board[currentFrame].points[currentTrial - 1].rawValue) ?? .miss
        }
        
        board[currentFrame].score += tempPoint.rawValue
        board[currentFrame].points[currentTrial] = tempPoint
        calculateBonusPonits(of: tempPoint)
        appendBonusPointQueueIfNeeded(of: point)
        
        if currentTrial > maxTrial {
            currentTrial = 0
            currentFrame += 1
        }

        calculatedCumulativeScore()
    }
    
    public func boardInfo() {
        board.forEach {
            print("Frame: \($0.number), [\($0.points[0].rawValue), \($0.points[1].rawValue), \($0.points[2].rawValue)], cumulativeScore: \($0.cumulativeScore)")
        }
    }
    
    public func isValid(ifAdd point: Point) -> Bool {
        if currentTrial == 0 && isSpare(when: point) {
            return false
        } else if currentTrial > 0 && point == .strike {
            return false
        } else if currentTrial > 0 && point != .spare && board[currentFrame].points[currentTrial - 1].rawValue + point.rawValue > 10 {
            return false
        }

        return true
    }
    
    private func isSpare(when point: Point) -> Bool {
        return point == .spare ||
            (currentTrial > 0 && board[currentFrame].points[currentTrial - 1].rawValue
                + point.rawValue == 10)
    }
    
    private func calculateBonusPonits(of point: Point) {
        var index = 0
        while index < bonusPointQueue.count {
            board[bonusPointQueue[index].frame].score += point.rawValue

            bonusPointQueue[index].count -= 1
            if bonusPointQueue[index].count <= 0 {
                bonusPointQueue.remove(at: index)
            } else {
                index += 1
            }
        }
    }
    
    private func appendBonusPointQueueIfNeeded(of point: Point) {
        if point == .strike  && currentFrame < board.count - 1 {
            bonusPointQueue.append(BonusPoint(type: .strike, frame: currentFrame, count: 2))
            currentTrial = 2
        } else if isSpare(when: point) && currentFrame < board.count - 1 {
            bonusPointQueue.append(BonusPoint(type: .spare, frame: currentFrame, count: 1))
            currentTrial += 1
        } else {
            currentTrial += 1
        }
    }
    
    private func calculatedCumulativeScore() {
        for i in 0..<board.count {
            if i > 0 {
                board[i].cumulativeScore = board[i].score + board[i - 1].cumulativeScore
            } else {
                board[i].cumulativeScore = board[i].score
            }
        }
    }
    
}
