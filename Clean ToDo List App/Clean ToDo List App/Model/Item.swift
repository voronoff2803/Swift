//
//  Item.swift
//  Clean ToDo List App
//
//  Created by Alexey Voronov on 28.04.2018.
//  Copyright © 2018 Alexey Voronov. All rights reserved.
//

import Foundation

struct Item {
    let name: String
    let comments: String
    
    let dueDate: Data
    var completionDate: Data?
    
    var isComplited: Bool {
        return completionDate != nil
    }
    
    init(name: String, comments: String = "", dueDate:Data) {
        self.name = name
        self.comments = comments
        self.dueDate = dueDate
    }
}
