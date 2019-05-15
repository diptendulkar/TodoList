//
//  ViewController.swift
//  Todo
//
//  Created by Diptendu Das on 06/05/2019.
//  Copyright © 2019 dip. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let datafile =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context =  (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
   // let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(datafile)
        
        
//        let newItem = Item()
//        newItem.title = "Find Book!!"
//        itemArray.append(newItem)
//
//        let newItem1 = Item()
//        newItem1.title = "Find Cloths!!"
//        itemArray.append(newItem1)
//
       // loadItems()
        
        //if let items = defaults.array(forKey: "todoItemArray") as? [Item] {
        //    itemArray = items
       // }
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true) // on press animation
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        self.saveItems()

    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
            
            let  item = Item(context: self.context)
            item.title = textField.text!
            item.done = false
            self.itemArray.append(item)
            // cannot insert Objects to UserDefaults
           // self.defaults.set(self.itemArray, forKey: "todoItemArray")
            
           self.saveItems()
           
        }
        alert.addTextField { (alertTexField) in
            alertTexField.placeholder = "Create new item"
            textField = alertTexField
            
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems(){
        
        do{
            try context.save()
        }catch{
            print("Error Encoding item array, \(error)")
        }
        
        //** below code is for Plist file storage
//        let encoder = PropertyListEncoder()
//
//        do{
//            let data = try encoder.encode(self.itemArray)
//            try data.write(to: self.datafile!)
//
//        }catch {
//            print("Error Encoding item array, \(error)")
//        }
        self.tableView.reloadData()
    }
    
    func loadItems(){
        
        
        
           //** below code is for Plist file storage
//        if let data = try? Data(contentsOf: datafile!) {
//            let decoder = PropertyListDecoder()
//            do{
//                itemArray = try decoder.decode([Item].self, from: data)
//
//            }catch {
//                print("Error Loading data \(error)")
//            }
//        }
    }
}

