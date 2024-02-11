//
//  Todos.swift
//  ToDoMate
//
//  Created by guncel on 9.02.2024.
//

import Foundation


struct Todos: Codable{
    let addTodo:String
    let addDescToDo:String
    let dueDate:String
    let createdDate:TimeInterval
    let isDone:Bool
}
