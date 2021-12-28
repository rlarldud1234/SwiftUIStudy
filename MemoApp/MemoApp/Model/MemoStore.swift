//
//  MemoStore.swift
//  MemoApp
//
//  Created by 김기영 on 2021/12/27.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Lorem Ipsum"),
            Memo(content: "안녕하세여ㅛ"),
            Memo(content: "dadsadasd")
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {return}
        memo.content = content
    }
    
    func delete(memo: Memo) {
        DispatchQueue.main.async {
            self.list.removeAll { $0 == memo }
        }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            self.list.remove(at: index)
        }
    }
}
