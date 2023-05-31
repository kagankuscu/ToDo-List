//
//  User.swift
//  ToDoList
//
//  Created by Kagan Kuscu on 24.05.23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
