//
//  EntryController.swift
//  Journal
//
//  Created by Stanfield on 9/4/21.
//

import Foundation

class EntryController {
    
    // MARK: - Shared Instance
    let shared = EntryController()
    
    // MARK: - SOT
    var entries: [Entry] = []
    
    // MARK: - CRUD Functions
    ///Create an entry and add it to the entries array.
    func createEntryWith(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
    }
    
    ///Find the index of the entry and remove it at that index.
    func delete(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else {return}
        entries.remove(at: index)
    }
}
