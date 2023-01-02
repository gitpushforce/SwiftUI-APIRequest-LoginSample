//
//  Model1.swift
//  JsonSwiftUI
//
//  Created by masaki on 2023/01/03.
//

import Foundation

struct Model1 : Decodable {
    var id : Int
    var name : String
    var email : String
    var address : Address
}

struct Address : Decodable {
    var street : String
    var geo : Geo
}

struct Geo : Decodable {
    var lat : String
}
