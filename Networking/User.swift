//
//  User.swift
//  Networking
//
//  Created by Никита Александров on 08.05.2023.
//

import Foundation

struct UserResults: Decodable {
    let results: [User]
    
    struct User: Decodable {
        var gender: String
        var name: Name
        var email: String
        var picture: Picture
    }
    
    struct Name: Decodable {
        var title: String
        var first: String
        var last: String
    }
    
    struct Picture: Decodable {
        var large: String
    }
    
}
