//
//  User.swift
//  User
//
//  Created by Russell Gordon on 2021-08-02.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
}
