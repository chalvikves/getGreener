//
//  user.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-14.
//

import SwiftUI

struct User {
    let username: String
    let password: String
    let id: UUID
    let firstname: String
    let lastname: String
    let transportation: Double
    let consumation: Double
    let food: Double
    let living: Double
    // let transportation: Array<Transport>
    //let consumation: Array<Consumation>
    //let food: Array<Food>
    let dailyQuestions: Array<Questions>
    //let living: Array<Living>
}


let testUser = User(username: "VeganVera", password: "test", id: UUID(), firstname: "Vera", lastname: "Vegan", transportation: 1.5, consumation: 1.623, food: 1.561, living: 1.54, dailyQuestions: [])
