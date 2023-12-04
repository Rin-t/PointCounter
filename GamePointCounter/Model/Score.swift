//
//  Score.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/03.
//

import Foundation
import SwiftData

@Model
final class Score {
    let participant: Participant
    let score: Int
    init(participant: Participant, score: Int) {
        self.participant = participant
        self.score = score
    }
}
