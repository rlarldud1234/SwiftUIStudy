//
//  MemoListScene.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                NavigationLink(destination: DetailScene(memo: memo), label: {
                    MemoCell(memo: memo)
                })
            }
            .navigationBarTitle("너의 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer))
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(show: self.$showComposer).environmentObject(self.store)
                    .environmentObject(KeyboardObserver())
            })
        }
    }
}

fileprivate struct ModalButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
