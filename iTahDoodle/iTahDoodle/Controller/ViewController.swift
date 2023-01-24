//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Adam Palmer on 23/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
    }

    @IBAction func insertButtonPressed(_ sender: UIButton) {
        guard let todo = itemTextField.text else {
            return
        }
        todoList.add(todo)
        tableView.reloadData()
        self.itemTextField.text = ""
    }

}

