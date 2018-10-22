//
//  ListTableViewController.swift
//  ToDo
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

var toDoList = ["hihi", "hello"]

class ListTableViewController: UITableViewController {

    
    @IBOutlet var listTableView: UITableView!
    
    //let storeList = UserDefaults.standard.set(toDoList, forKey: "ToDoList")
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        listTableView.dataSource = self
        listTableView.delegate = self
        toDoList = UserDefaults.standard.stringArray(forKey: "ToDoList") ?? ["hihi", "hello"]
        
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return toDoList.count
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = toDoList[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        /*else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    */
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func viewDidAppear(_ animated: Bool) {
        listTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let cell = sender as! UITableViewCell
        if segue.identifier == "ToEditViewSegue"{
            let cell = sender as! UITableViewCell
            if let indexPath = listTableView.indexPath(for: cell){
                
                let navVC = segue.destination as! UINavigationController
                let editVC = navVC.viewControllers.first as! EditItemViewController
                
                //let text:String = toDoList[indexPath.row]
                //print(text)
                editVC.originalText = toDoList[indexPath.row]
                editVC.listIndex = indexPath.row
                //let editViewController = segue.destination as! EditItemViewController
                //editViewController.inputTextField.text = toDoList[indexPath.row]
                //editViewController.listIndex = indexPath.row
                
                
            }
        }
        
        
        
    }


}
