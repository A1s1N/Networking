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
        var location: Location
        var nat: String
        var phone: String
        var dob: Dob
    }
    
    struct Name: Decodable {
        var title: String
        var first: String
        var last: String
    }
    
    struct Picture: Decodable {
        var large: String
    }
    
    struct Location: Decodable {
        var city: String
        var state: String
        var country: String
        var postcode: Int
    }
    
    struct Dob: Decodable {
        var age: Int
    }
}
