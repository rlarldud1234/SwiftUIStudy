//
//  ContentView.swift
//  SwfitUIText
//
//  Created by 김기영 on 2021/10/01.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var id = ""
    @State var pw = ""
    @State var tag: Int?

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 50) {
                Text("로그인 화면")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                VStack(spacing: 5) {
                    TextField("  아이디를 입력해주세요", text: $id)
                        .frame(width: 300, height: 40, alignment: .leading)
                        .keyboardType(.default)
                    .background(Color.white)
                    .font(.caption)
                    .border(Color.black, width: 1)
                    .padding()
                
                    TextField("  비밀번호를 입력해주세요", text: $pw)
                        .frame(width: 300, height: 40, alignment: .leading)
                        .keyboardType(.default)
                    .background(Color.white)
                    .font(.caption)
                    .border(Color.black, width: 1)
                    .padding()
                }
                
                Button(action: {}) {
                    Text("로그인")
                        .bold()
                        .frame(width: 300, height: 50, alignment: .center)
                        .font(.title)
                        .foregroundColor(.init(.white))
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                HStack(alignment: .center) {
                    Text("아직 회원가입을 안하셨다면 ->")
                        .font(.caption)
                    
                    Button(action: {
                        self.tag = 1
                    }){
                        Text("회원가입")
                            .underline(true, color: Color.blue )
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
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
