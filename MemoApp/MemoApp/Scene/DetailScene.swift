//
//  DetailScene.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var showEditSheet = false
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(self.memo.insertDate, formatter: formatter)")
                            .padding()
                            .font(.footnote)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        
                        Spacer()
                    }
                }
                HStack {
                    Button(action: {
                        self.showEditSheet.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                    }).padding()
                        .sheet(isPresented: $showEditSheet,  content: {
                            ComposeScene(memo: self.memo, show: $showEditSheet)
                                .environmentObject(self.store)
                                .environmentObject(KeyboardObserver())
                        })
                }
            }
        }
        .navigationBarTitle("메모 보기")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "SwiftUI"))
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
