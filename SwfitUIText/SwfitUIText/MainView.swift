//
//  MainView.swift
//  SwfitUIText
//
//  Created by 김기영 on 2021/10/30.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            Section(header: Text("섹션1")){
                ForEach(1...5, id:\.self){index in
                    CellView(icon: "book.fill", title: "책을 읽으세요  \(index)", start: "pm 1", end: "pm 10", color: Color.pink)
                }.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header: Text("섹션2")){
                ForEach(1...5, id:\.self){index in
                    CellView(icon: "heart.fill", title: "하트 읽으세요  \(index)", start: "am 3", end: "am 7", color: Color.yellow)
                }
            }.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
        }.listStyle(.plain)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
