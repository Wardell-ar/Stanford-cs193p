//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 吴泓霖 on 2024/10/11.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards:[Card]//private（set）限制外部修改。意味着其他类或结构体可以访问并读取 cards，但不能修改它的值
    //构造初始化函数Memory<String>()
    //表示需要输入一个Int类型以及一个Int入、CardContent出的函数
    init(numberOfPairsOfCards: Int,cardContentFatory: (Int) ->CardContent){
        cards=[]
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFatory(pairIndex)
            cards.append(Card(content:content))
            cards.append(Card(content:content))
        }
    }
    //默认情况下，实例方法不能直接修改它们的属性。如果你需要一个方法能够修改实例本身的属性，就必须使用 mutating 关键字。
    mutating func shuffle(){
        cards.shuffle()
    }
    
    func choose(_ card:Card){
        
    }
    
    struct Card{
        var isFaceUp=true
        var ismatched=false
        var content:CardContent

    }
}
