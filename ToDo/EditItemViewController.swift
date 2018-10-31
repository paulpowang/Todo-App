//
//  EditItemViewController.swift
//  ToDo
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    var listIndex: Int?
    var originalText: String?
    
    @IBAction func saveButton(_ sender: Any) {
        
        if (inputTextField.text != originalText){
            
            toDoList[listIndex!]["task"] = inputTextField.text!
            
            UserDefaults.standard.set(toDoList, forKey: "ToDoList")
            
            //dismiss current view
            dismiss(animated: true, completion: nil)
            
        }else{
            
            let noItemAlert = UIAlertController(title: "No Changes", message: "No change made."
                , preferredStyle: UIAlertController.Style.alert)
            self.present(noItemAlert, animated: true, completion: nil)
            
            //dismiss the alert
            dismiss(animated: true, completion: nil)
            
            
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if(inputTextField.text != originalText){
            
            let unsavedItemAlert = UIAlertController(title: "Item Changed", message: "Discard unsaved changes?"
                , preferredStyle: UIAlertController.Style.alert)
            
            let discardAction = UIAlertAction(title: "Discard", style: UIAlertAction.Style.default){(action) in
                self.inputTextField.text = ""
                self.dismiss(animated: true, completion: nil)
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default)
            
            unsavedItemAlert.addAction(discardAction)
            unsavedItemAlert.addAction(cancelAction)
            
            self.present(unsavedItemAlert, animated: true, completion: nil)
            
        }else{
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.text = originalText

        // Do any additional setup after loading the view.
    }
    

}
