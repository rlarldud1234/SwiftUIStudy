//
//  ContentModel.swift
//  Muleobolram
//
//  Created by 김기영 on 2022/01/06.
//

import Foundation

struct ContentModel: Codable {
    let id: String
    let content: String
}

struct ContentList: Codable {
    let contentList: [ContentModel]
}
