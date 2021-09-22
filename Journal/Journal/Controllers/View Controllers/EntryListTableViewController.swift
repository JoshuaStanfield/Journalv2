//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Stanfield on 9/5/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    // MARK: - Properties
    var journal: Journal?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Journalv2"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal?.entries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        guard let journal = journal?.entries[indexPath.row] else { return UITableViewCell() }
        
        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journal = journal else { return }
            let entryToDelete = journal.entries[indexPath.row]
            EntryController.delete(entry: entryToDelete, journal: journal)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO: Identifier, index, destination, object to send, object to receive.
        guard let destinationVC = segue.destination as? EntryDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == "toDetailVC" {
            guard let journal = journal else { return }
            let entryToSend = journal.entries[indexPath.row]
            destinationVC.entry = entryToSend
        }
    }
}
