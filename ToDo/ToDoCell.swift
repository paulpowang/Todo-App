//
//  ToDoCell.swift
//  ToDo
//
//  Created by paul on 10/24/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskCompleteButtonColor: UIButton!
    
    var toDoListIndex: Int!
    var isComplete: Bool!
    
    
    
    
    @IBAction func taskCompleteButton(_ sender: UIButton) {
        
        if !isComplete {
            doneLabel.text = "Done"
            taskCompleteButtonColor.backgroundColor = UIColor.blue
            //update to toDoList
            toDoList[toDoListIndex][ISCOMPLETE] = true
            let isCompleteString = toDoList[toDoListIndex][TASK] as! String
            //update to isCompleteToDoList
            isCompleteToDoList.append([TASK:isCompleteString])
            
            //print(isCompleteToDoList)
            UserDefaults.standard.set(toDoList, forKey: "ToDoList")
            UserDefaults.standard.set(isCompleteToDoList, forKey: COMPLETE_LIST)
            isComplete = true
        }/*else{
            doneLabel.text = ""
            taskCompleteButtonColor.backgroundColor = UIColor.lightGray
            toDoList[toDoListIndex][ISCOMPLETE] = false
            
            isComplete = false
        }*/
        
        
        
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
