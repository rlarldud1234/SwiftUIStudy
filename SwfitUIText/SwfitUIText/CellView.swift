//
//  CellView.swift
//  SwfitUIText
//
//  Created by 김기영 on 2021/10/30.
//

import SwiftUI

struct CellView: View {
    var icon: String
    var title: String
    var start: String
    var end: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color.white)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                Spacer().frame(height: 5)
                Text("\(start)~\(end)")
                    .foregroundColor(Color.white)
            }
        }
        .frame(alignment: .leading)
        .padding(20)
        .background(color)
        .cornerRadius(20)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(icon: "book.fill", title: "책을 읽읍시다", start: "pm 1", end: "pm 5", color: Color.purple)
    }
}
