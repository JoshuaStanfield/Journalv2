//
//  Journal.swift
//  Journal
//
//  Created by Stanfield on 9/18/21.
//

import Foundation

class Journal {
    
    let title: String
    var entries: [Entry]
    
    init(title: String, entries: [Entry] = []) {
        self.title = title
        self.entries = entries
    }
}

extension Journal: Equatable {}

func ==(lhs: Journal, rhs: Journal) -> Bool {
    if lhs.title != rhs.title { return false }
    if lhs.entries != rhs.entries { return false }
    //Add the above for each model property.
    
    return true
}
