//
//  Participant.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/03.
//

import Foundation
import SwiftData


@Model
final class Participant {

    let name: String

    init(name: String) {
        self.name = name
    }
}
