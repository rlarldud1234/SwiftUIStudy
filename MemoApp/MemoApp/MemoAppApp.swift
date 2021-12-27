//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

@main
struct MemoAppApp: App {
    let store = MemoStore()
    
    var body: some Scene {
        WindowGroup {
            MemoListScene()
                .environmentObject(store)
                .environmentObject(DateFormatter.memoDateFormatter)
        }
    }
}
