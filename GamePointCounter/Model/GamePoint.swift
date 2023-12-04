//
//  GamePoint.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/03.
//

import Foundation
import SwiftData


@Model
final class Game {
    let id: String
    var name: String
    var scores: [Score]

    init(id: String, name: String, scores: [Score]) {
        self.id = id
        self.name = name
        self.scores = scores
    }
}
