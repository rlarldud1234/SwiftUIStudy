//
//  MemoCell.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI



struct  MemoCell: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text("\(memo.insertDate, formatter: self.formatter)")
                .font(.caption)
                .foregroundColor(.gray)
            
        }
    }
}

struct MemoCell_PreViews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
