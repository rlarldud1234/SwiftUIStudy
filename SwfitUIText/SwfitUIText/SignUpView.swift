//
//  SignUpView.swift
//  SwfitUIText
//
//  Created by 김기영 on 2021/10/30.
//

import SwiftUI

struct SignUpView: View {
    
    @State var id = ""
    @State var pw = ""
    @State var name = ""
    @State var tag: Int?
    
    var body: some View {
        ZStack {
        VStack(spacing: 50) {
            Text("회원가입")
                .font(.largeTitle)
                .bold()
                .padding()
            
            VStack(alignment: .center, spacing: 5) {
                HStack(spacing: 9) {
                    Spacer()
                    Text("아이디")
                        .font(.caption)
                        .padding()
                    TextField("아이디를 입력해주세요.",text: $id)
                        .font(.caption)
                        .padding()
                        .border(.black, width: 1)
                }
                HStack {
                    Spacer()
                    Text("비밀번호")
                        .font(.caption)
                        .padding()
                    TextField("비밀번호를 입력해주세요.",text: $pw)
                        .font(.caption)
                        .padding()
                        .border(.black, width: 1)
                }
                HStack(spacing: 14) {
                    Spacer()
                    Text("이름")
                        .font(.caption)
                        .padding()
                    TextField("이름을 입력해주세요.",text: $name)
                        .font(.caption)
                        .padding()
                        .border(.black, width: 1)
                }
            }
            
            Button(action: {
                self.tag = 1
            }) {
                Text("회원가입")
                    .font(.title)
                    .bold()
                    .frame(width: 300, height: 50, alignment: .center)
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
                    .background(Color.green)
            }
        }
        }.edgesIgnoringSafeArea(.all)
}
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
