//
//  JournalListViewController.swift
//  Journal
//
//  Created by Stanfield on 9/20/21.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalListTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        journalListTableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
        guard let title = journalTitleTextField.text, !title.isEmpty else { return }
            JournalController.shared.createJournalWith(title: title)
            journalListTableView.reloadData()
            journalTitleTextField.text = ""
    }
    
    // MARK: - DataSource Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalController.shared.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        
        let journal = JournalController.shared.journals[indexPath.row]
        
        cell.textLabel?.text = journal.title
        cell.detailTextLabel?.text = "\(journal.entries.count)"
        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryList" {
            if let index = journalListTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? EntryListTableViewController {
                    let journalToSend = JournalController.shared.journals[index.row]
                    destinationVC.journal = journalToSend
                }
            }
        }
    }
}
