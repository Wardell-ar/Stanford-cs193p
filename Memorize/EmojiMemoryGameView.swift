//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by admin on 2024/9/30.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //@变量最好都定义在body部分之外
    let emojis:[String]=["😗","😙","😚","😘","😇","🥳","🤓"]
    @State  var cardCount: Int = 4
    
    var body: some View {
        
        VStack(){
            ScrollView{
                cards
            }
            Spacer()
            adjusters
        }
        .padding()
        
    }
    
    var cards:some View{
        //LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){//表示每一行的排列
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){//表示每一列的最小宽度
            
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content:emojis[index], isFaceUp: true)
                    .aspectRatio(2/3,contentMode: .fit)//用于设置卡片视图的宽高比以及缩放模式
            }
        }
        .foregroundColor(.orange)
    }
    
    //by是对外名称，offset是对内名称
    func cardCountAdjuster(by offset:Int,symbol :String)->some View{
        Button(action: {
            cardCount+=offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount+offset>emojis.count||cardCount+offset<1)
      
    }
    
    var adjusters:some View{
        HStack{
            cardCountAdjuster(by: -1,symbol :"rectangle.stack.badge.minus.fill")
            
            Spacer()
            
            cardCountAdjuster(by: +1,symbol :"rectangle.stack.badge.plus.fill")
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
}

struct CardView: View {
    //let常量可以在声明时不初始化，但必须在使用之前进行初始化。一旦赋值，它的值就不能再改变。
    let content:String
    
    @State var isFaceUp:Bool=false
//    var base: RoundedRectangle=RoundedRectangle(cornerRadius: 12)
   
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
            
        
        ZStack/*(alignment: .top)*/{//(alignment: .top)可包含（）一起删除，因为尾随闭包语法
           
            Group{
                base
                    .fill(.white)//一个填充圆
                    .strokeBorder(lineWidth: 2)//一个圆边缘
                    
                Text(content)
                    .font(.largeTitle)//圆的内部字符
            }
                base
                    .fill()//图案上的橙色覆盖
                    .opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture(count:2) {
            //print("tapped")
            //如果你想在视图中修改属性值并使得 UI 随之更新，必须使用 @State、@Binding、@ObservedObject 或 @EnvironmentObject 这些修饰符
            //isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}



#Preview {
    EmojiMemoryGameView()
}
