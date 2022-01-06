//
//  MuleobolramAPI.swift
//  Muleobolram
//
//  Created by 김기영 on 2022/01/06.
//

import Foundation
import Moya

enum MuleobolramAPI {
    
    // Auth
    case signIn(id: String, pw: String)
    case signUp(name: String, id: String, pw: String)
    case checkId(id: String)
    
    // Community
    case addPost(title: String, content: String)
    case getPost
    case deletePost(post_id: Int)
    
    // Comment
    case addComment(post_id: Int, content: String)
    case getComment(post_id: Int, id: String, content: String)
}

extension MuleobolramAPI:  TargetType {
    
    var baseURL: URL {
        URL(string: "http://13.125.241.176:8080")!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/login"
        case .signUp:
            return "/signup"
        case .checkId:
            return "/auth"
        case .addPost, .getPost:
            return "/post"
        case .deletePost(let id):
            return "/post/<\(id)>"
        case .addComment, .getComment:
            return "/comment"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn, .signUp, .checkId, .addPost, .addComment:
            return .post
            
        case .getPost, .getComment:
            return .get
            
        case .deletePost:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
            
        case .signIn(let id, let pw):
            return .requestParameters(parameters: ["id": id, "password": pw],
                                      encoding: JSONEncoding.prettyPrinted)
        case .signUp(let name, let id, let pw):
            return .requestParameters(parameters: ["name": name, "id": id, "password": pw],
                                      encoding: JSONEncoding.prettyPrinted)
        case .checkId(let id):
            return .requestParameters(parameters: ["id": id], encoding: JSONEncoding.prettyPrinted)
        case .addPost(let title, let content):
            return .requestParameters(parameters: ["title": title, "content": content],
                                      encoding: JSONEncoding.prettyPrinted)
        case .addComment(let post_id, let content):
            return .requestParameters(parameters: ["post_id": post_id, "content": content],
                                      encoding: URLEncoding.queryString)
        case .getComment(let post_id, let id, let content):
            return .requestParameters(parameters: ["post_id": post_id, "id": id, "content": content],
                                      encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn, .signUp, .checkId:
            return ["Content-Type" : "application/json"]
        default:
            guard let token = Token.access_token else { return ["Content-Type" : "application/json"] }
            return ["Authorization" : "Bearer " + token]
        }
    }
    
}
