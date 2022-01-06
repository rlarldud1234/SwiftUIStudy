//
//  TokenModel.swift
//  Muleobolram
//
//  Created by 김기영 on 2022/01/06.
//

import Foundation
import CombineMoya

struct TokenModel: Codable {
    let access_token: String
    let refresh_token: String
}

struct Token {
    
    static var _access_token: String?
    static var access_token: String? {
        get {
            _access_token = UserDefaults.standard.string(forKey: "token")
            return _access_token
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
            _access_token = UserDefaults.standard.string(forKey: "token")
        }
    }
    
    static func logOut() {
        access_token = nil
    }
}


