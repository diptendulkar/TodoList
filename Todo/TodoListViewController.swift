//
//  ViewController.swift
//  Todo
//
//  Created by Diptendu Das on 06/05/2019.
//  Copyright © 2019 dip. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Grocerry"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

