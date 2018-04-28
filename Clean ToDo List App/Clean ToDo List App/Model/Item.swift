//
//  Item.swift
//  Clean ToDo List App
//
//  Created by Alexey Voronov on 28.04.2018.
//  Copyright © 2018 Alexey Voronov. All rights reserved.
//

import Foundation

struct Item {
    let id: UInt
    
    let name: String
    let comments: String
    
    let dueDate: Date
    var completionDate: Date?
    
    var isCompleted: Bool {
        return completionDate != nil
    }
    
    private static var currentID: UInt = 0
    
    init(name: String, comments: String = "", dueDate:Date) {
        self.name = name
        self.comments = comments
        self.dueDate = dueDate
        self.id = Item.currentID
        Item.currentID += 1
    }
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
}
