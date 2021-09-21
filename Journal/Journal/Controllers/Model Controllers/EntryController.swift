//
//  EntryController.swift
//  Journal
//
//  Created by Stanfield on 9/4/21.
//

import Foundation

class EntryController {
    
    // MARK: - CRUD Functions
    ///Create an entry and add it to the entries array.
    static func createEntryWith(title: String, body: String, journal: Journal) {
        let entry = Entry(title: title, body: body)
        JournalController.shared.addEntryTo(journal: journal, entry: entry)
    }
    
    ///Find the index of the entry and remove it at that index.
    static func delete(entry: Entry, journal: Journal) {
        JournalController.shared.removeEntryFrom(journal: journal, entry: entry)
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
