//
//  ContentView.swift
//  SwfitUIText
//
//  Created by 김기영 on 2021/10/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var id = ""
    @State var pw = ""
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 50) {
                Text("로그인 화면")
                    .font(.largeTitle)
                    .padding()
                
                VStack(spacing: 5) {
                TextField("아이디를 입력해주세요", text: $id)
                        .frame(width: 300, height: 30, alignment: .leading)
                        .keyboardType(.default)
                    .background(Color.white)
                    .padding()
                
                TextField("비밀번호를 입력해주세요", text: $pw)
                        .frame(width: 300, height: 30, alignment: .leading)
                        .keyboardType(.default)
                    .background(Color.white)
                    .padding()
                }
                
                Button(action: {}) {
                    Text("로그인")
                        .frame(width: 80, height: 30, alignment: .center)
                        .font(.body)
                        .foregroundColor(.init(.blue))
                        .background(Color.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
