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
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
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
                Text("🤓")
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
