//
//  User.swift
//  ToDoMate
//
//  Created by guncel on 6.02.2024.
//

import Foundation

struct User:Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
