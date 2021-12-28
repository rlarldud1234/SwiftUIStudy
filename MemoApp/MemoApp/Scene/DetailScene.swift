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
    @State private var showDeleteAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
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
                    }
                }
                HStack {
                    
                    Button(action: {
                        self.showDeleteAlert.toggle()
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "trash")
                            .tint(Color.red)
                    })
                        .padding()
                        .alert(isPresented: $showDeleteAlert, content: {
                            Alert(title: Text("삭제"), message: Text("게시물을 삭제하시겠습니까?"), primaryButton: .destructive(Text("삭제"),
                                                                                                                  action: {
                                self.store.delete(memo: self.memo)
                            }),
                                  secondaryButton: .cancel())
                        })
                    
                    Spacer()
                    
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
                .padding(.leading)
                .padding(.trailing)
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
