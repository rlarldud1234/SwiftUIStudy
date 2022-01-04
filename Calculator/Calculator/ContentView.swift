//
//  ContentView.swift
//  Calculator
//
//  Created by 김기영 on 2022/01/04.
//

import SwiftUI

struct ContentView: View {
    @State var outNum: String = "0"
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            HStack{
                Spacer()
                Spacer()
                Spacer()
                Text(outNum)
                Spacer()
            }
            Btn(num1: "1", num2: "2", num3: "3", symbol: "+", outNum: $outNum)
            Btn(num1: "4", num2: "5", num3: "6", symbol: "-", outNum: $outNum)
            Btn(num1: "7", num2: "8", num3: "9", symbol: "*", outNum: $outNum)
            Btn(num1: "=", num2: "0", num3: "C", symbol: "/", outNum: $outNum)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Btn: View {
    var firstNum = 0
    var secondeNum = 0
    var num1: String
    var num2: String
    var num3: String
    var symbol: String
    
    @Binding var outNum: String
    var body: some View {
        HStack {
            Button(action: {
                if outNum == "0" {
                    outNum = num1
                } else {
                    outNum = outNum + num1
                }
            }, label: {
                Text(num1)
            }).padding()
            
            Button(action: {
                if outNum == "0" {
                    outNum = num2
                } else {
                    outNum = outNum + num2
                }
            }, label: {
                Text(num2)
            }).padding()
            
            Button(action: {
                if outNum == "0" {
                    outNum = num3
                } else {
                    outNum = outNum + num3
                }
            }, label: {
                Text(num3)
            }).padding()
            
            Button(action: {
                
            }, label: {
                Text(symbol)
            }).padding()
        }
    }
}
