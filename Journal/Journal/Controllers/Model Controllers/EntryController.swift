//
//  EntryController.swift
//  Journal
//
//  Created by Stanfield on 9/4/21.
//

import Foundation

class EntryController {
    
    // MARK: - Shared Instance
    static let shared = EntryController()
    
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
    
    // MARK: - Persistence
    
    //fileURL
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Journal.json")
        return fileURL
    }
    
    // Save
    func saveToPersistenceStore() {
        
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    // Load
    func loadFromPersistanceStore() {
        do{
            let data = try Data(contentsOf: fileURL())
            entries = try JSONDecoder().decode([Entry].self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
