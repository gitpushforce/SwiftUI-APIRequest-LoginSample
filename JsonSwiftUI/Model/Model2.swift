//
//  Model2.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/03.
//

import Foundation

struct Model2 : Decodable {
    var data : [UserList]
}

struct User : Decodable {
    var data : UserList
}

struct UserList : Decodable {
    var id : Int
    var first_name : String
    var email :String
    var avatar : String
}
