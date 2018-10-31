//
//  CompletedTaskViewController.swift
//  ToDo
//
//  Created by paul on 10/24/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class CompletedTaskViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return isCompleteToDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = isCompleteToDoList[indexPath.row][TASK] as? String

        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

}
