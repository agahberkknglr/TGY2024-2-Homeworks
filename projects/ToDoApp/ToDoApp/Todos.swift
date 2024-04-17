//
//  Todos.swift
//  ToDoApp
//
//  Created by Agah Berkin Güler on 17.04.2024.
//

import Foundation

enum TodoStatus: Int {
    case undone = 0
    case inprogress = 1
    case done = 2
}

struct Todo {
    let name: String
    var status: TodoStatus
}
