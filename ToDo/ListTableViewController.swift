//
//  ListTableViewController.swift
//  ToDo
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit


let TASK = "task" //toDoList reference 1
let ISCOMPLETE = "isComplete" //toDoList reference 2
let COMPLETE_LIST = "CompletedList" //for isCompleteToDoList key in UserDefault
var toDoList = [[TASK: "hihi", ISCOMPLETE : false]]
var isCompleteToDoList: [[String:Any]] = [[:]]

class ListTableViewController: UITableViewController {

    
    @IBOutlet var listTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        listTableView.dataSource = self
        listTableView.delegate = self
    
        toDoList = UserDefaults.standard.object(forKey: "ToDoList") as![[String:Any]]
        
        isCompleteToDoList = UserDefaults.standard.object(forKey: COMPLETE_LIST) as![[String:Any]]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell

        // Configure the cell...
        cell.taskLabel!.text = toDoList[indexPath.row][TASK] as? String
        cell.toDoListIndex = indexPath.row 
        cell.isComplete = toDoList[indexPath.row][ISCOMPLETE] as? Bool
        
        if toDoList[indexPath.row][ISCOMPLETE] as! Bool {
            cell.doneLabel.text = "Done"
            cell.taskCompleteButtonColor.backgroundColor = UIColor.blue
        }else{
            cell.doneLabel.text = ""
            cell.taskCompleteButtonColor.backgroundColor = UIColor.lightGray
        }
        
        
        return cell
    }
    
    @IBAction func clearList(_ sender: Any) {
        
        toDoList = [[TASK: "Empty List", ISCOMPLETE : false]]
        UserDefaults.standard.set(toDoList, forKey: "ToDoList")
        tableView.reloadData()
        
        
    }
    
    
    

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
                
                editVC.originalText = toDoList[indexPath.row][TASK] as! String
                editVC.listIndex = indexPath.row
                
                
            }
        }
        
    }


}
