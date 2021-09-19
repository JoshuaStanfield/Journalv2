//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Stanfield on 9/7/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var entry: Entry?
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - IBAction
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let entry = entry {
            print("To be implemented tomorrow")
        } else {
            guard let titleTextFieldText = titleTextField.text,
                  !titleTextFieldText.isEmpty,
                  let bodyTextViewText = bodyTextView.text,
                  !bodyTextViewText.isEmpty else { return }
            EntryController.shared.createEntryWith(title: titleTextFieldText, body: bodyTextViewText)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Functions
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
