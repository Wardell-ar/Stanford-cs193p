//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 吴泓霖 on 2024/10/11.
//

import Foundation


class EmojiMemoryGame:ObservableObject{
    private static let emojis=["😀","😃","🥹","😎","🤩","🥵","🥰","👾","👽","😅"]
    
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame()->MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 16){pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }
            else{
                return "⁉️"
            }
           
        }
    }
    
    var cards:[MemoryGame<String>.Card]{
        return model.cards
    }
    //MARK: - Intents
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
