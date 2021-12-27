//
//  ComposeScene.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $content)
                    .background(Color.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("메모 추가하기", displayMode: .inline)
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
    }
}
