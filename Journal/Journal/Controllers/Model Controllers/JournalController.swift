//
//  JournalController.swift
//  Journal
//
//  Created by Stanfield on 9/19/21.
//

import Foundation

class JournalController {
    
    // MARK: - Shared Instance
    static let shared = JournalController()
    
    var journals: [Journal] = []
    
    // MARK: - CRUD Functions
    ///Create
    func createJournalWith(title: String) {
        let journal = Journal(title: title)
        journals.append(journal)
    }
    
    ///Delete a Journal
    func delete(journal: Journal) {
        guard let journalToDelete = journals.firstIndex(of: journal) else { return }
        journals.remove(at: journalToDelete)
    }
    
    ///Add Entry to Journal
    func addEntryTo(journal: Journal, entry: Entry) {
        journal.entries.append(entry)
    }
    
    ///Remove entry from Journal
    func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let entryToDelete = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: entryToDelete)
    }
}
