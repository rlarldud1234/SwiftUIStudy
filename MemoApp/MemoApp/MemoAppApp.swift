//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import SwiftUI

@main
struct MemoAppApp: App {
    let context = CoreDataManager.persistentContainer.viewContext
    let store = MemoStore()
    
    var body: some Scene {
        WindowGroup {
            MemoListScene()
                .environment(\.managedObjectContext, context)
                .environmentObject(store)
                .environmentObject(DateFormatter.memoDateFormatter)
        }
    }
}
