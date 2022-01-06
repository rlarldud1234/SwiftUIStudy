//
//  CommunityModel.swift
//  Muleobolram
//
//  Created by 김기영 on 2022/01/06.
//

import Foundation

struct CommunityModel: Codable {
    let id_pk: Int
    let title: String
    let name: String
    let content: String
    let created_at: String
}

struct post: Codable {
    var post: [CommunityModel]
}
