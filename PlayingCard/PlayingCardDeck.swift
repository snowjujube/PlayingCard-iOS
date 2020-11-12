//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by kuku on 2020/11/12.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard {
        return cards.remove(at: cards.count.random)
    }
}


extension Int {
    var random: Int {
        switch self {
        case self where self > 0: return Int(arc4random_uniform(UInt32(self)))
        case self where self == 0: return 0
        case self where self < 0: return -Int(arc4random_uniform(UInt32(abs(self))))
        default:
            return 0
        }
    }
}
