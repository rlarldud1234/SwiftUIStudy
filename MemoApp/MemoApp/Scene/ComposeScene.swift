//
//  ComposeScene.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var keyboard: KeyboardObserver
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    var memo: Memo? = nil
    
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, keyboard.context.height)
                    .animation(.easeInOut(duration: keyboard.context.animationDuration))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(memo != nil ? "메모 편집" : "메모 추가하기", displayMode: .inline)
            .navigationBarItems(leading: DismissButton(show: $show), trailing: SetButton(show: $show, content: $content))
        }
    }
}

fileprivate struct DismissButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}

fileprivate struct SetButton: View {
    @Binding var show: Bool
    
    @EnvironmentObject var store: MemoStore
    @Binding var content: String
    
    var body: some View {
        Button(action: {
            self.store.insert(memo: self.content)
            
            self.show = false
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(show: .constant(false))
            .environmentObject(MemoStore())
            .environmentObject(KeyboardObserver())
    }
}
