//
//  ResultView.swift
//  GamePointCounter
//
//  Created by Rin on 2023/12/04.
//

import SwiftUI
import SwiftData

struct ResultView: View {

    private struct Rank {
        let name: String
        let point: Int
    }

    @Query private var games: [Game]

    private var ranking: [Rank] {
        var totalScores = [String: Int]()

        // 各ゲームのスコアをループして集計
        for game in games {
            for score in game.scores {
                let name = score.participant.name
                totalScores[name, default: 0] += score.score
            }
        }

        // 集計された得点を基にRankの配列を作成
        let ranks = totalScores.map { Rank(name: $0.key, point: $0.value) }

        // 得点が高い順にソート
        return ranks.sorted { $0.point > $1.point }
    }

    var body: some View {

        List(ranking, id: \.name) { rank in
            HStack {
                Text(rank.name)
                Text("\(rank.point)")
            }
        }
    }
}

#Preview {
    ResultView()
}
