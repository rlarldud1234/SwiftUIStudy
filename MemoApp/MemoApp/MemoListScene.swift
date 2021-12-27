//
//  ContentView.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore
    
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                Text(memo.content)
            }
            .navigationBarTitle("너의 메모")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
    }
}
