//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by admin on 2024/9/30.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    //@变量最好都定义在body部分之外
   
    
    var body: some View {
        
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        
        .padding()
        
    }
    
    var cards:some View{
        //LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){//表示每一行的排列
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85),spacing: 0)]){//表示每一列的最小宽度
            
            ForEach(viewModel.cards.indices, id: \.self) {index in
                CardView( viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)//用于设置卡片视图的宽高比以及缩放模式
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
    
    //by是对外名称，offset是对内名称
//    func cardCountAdjuster(by offset:Int,symbol :String)->some View{
//        Button(action: {
//            cardCount+=offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount+offset>emojis.count||cardCount+offset<1)
//      
//    }
//    
//    var adjusters:some View{
//        HStack{
//            cardCountAdjuster(by: -1,symbol :"rectangle.stack.badge.minus.fill")
//            
//            Spacer()
//            
//            cardCountAdjuster(by: +1,symbol :"rectangle.stack.badge.plus.fill")
//            
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
    
}

struct CardView: View {
    var card:MemoryGame<String>.Card
   
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
            
        
        ZStack/*(alignment: .top)*/{//(alignment: .top)可包含（）一起删除，因为尾随闭包语法
           
            Group{
                base
                    .fill(.white)//一个填充圆
                    .strokeBorder(lineWidth: 2)//一个圆边缘
                    
                Text(card.content)
                    .font(.system(size:100))//圆的内部字符
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
                base
                    .fill()//图案上的橙色覆盖
                    .opacity(card.isFaceUp ? 0 : 1)
            
        }
//        .onTapGesture(count:2) {
//            //print("tapped")
//            //如果你想在视图中修改属性值并使得 UI 随之更新，必须使用 @State、@Binding、@ObservedObject 或 @EnvironmentObject 这些修饰符
//            //isFaceUp = !isFaceUp
//            card.isFaceUp.toggle()
//        }
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
