//
//  DetailViewController.swift
//  Clean ToDo List App
//
//  Created by Alexey Voronov on 29.04.2018.
//  Copyright © 2018 Alexey Voronov. All rights reserved.
//

import UIKit

protocol DetailViewControllDelegate: AnyObject {
    func detailViewController(_ controller: DetailViewController, didFinishAdding item: Item)
}

class DetailViewController: UITableViewController {
    weak var delegate: DetailViewControllDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let item = Item(name: nameTextField.text!, comments: commentsTextView.text!, dueDate: dueDatePicker.date)
        delegate?.detailViewController(self, didFinishAdding: item)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
