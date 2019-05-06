//
//  ViewController.swift
//  Todo
//
//  Created by Diptendu Das on 06/05/2019.
//  Copyright © 2019 dip. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Grocery","Payment","Personal","Official"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true) // on press animation
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
           
        }
        alert.addTextField { (alertTexField) in
            alertTexField.placeholder = "Create new item"
            textField = alertTexField
            
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

