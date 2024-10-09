//
//  ContentView.swift
//  Memorize
//
//  Created by admin on 2024/9/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .foregroundColor(Color.orange)
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, CS139p!🤓")
//        }
        HStack{
            let emojis:[String]=["😗","😙","😚","😘"]
            ForEach(emojis, id: \.self) {emoji in
                CardView(content:emoji, isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    //let常量可以在声明时不初始化，但必须在使用之前进行初始化。一旦赋值，它的值就不能再改变。
    let content:String
    
    @State var isFaceUp:Bool=false
//    var base: RoundedRectangle=RoundedRectangle(cornerRadius: 12)
   
    var body: some View {
        let base = Circle()
        ZStack/*(alignment: .top)*/{//(alignment: .top)可包含（）一起删除，因为尾随闭包语法
           
            if isFaceUp{
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }else{
                base
                    .fill()
            }
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
    ContentView()
}
