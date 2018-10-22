//
//  NewItemViewController.swift
//  ToDo
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        
        if (inputTextField.text != ""){
            toDoList.append(inputTextField.text!)
            UserDefaults.standard.set(toDoList, forKey: "ToDoList")
            inputTextField.text = ""
            
            //dismiss current view
            dismiss(animated: true, completion: nil)
            
        }else{
            
            let noItemAlert = UIAlertController(title: "No Item", message: "No item is added."
                , preferredStyle: UIAlertController.Style.alert)
            self.present(noItemAlert, animated: true, completion: nil)
            
            //dismiss the alert
            dismiss(animated: true, completion: nil)
            
        }

    }
    
    @IBAction func cancelButton(_ sender: Any) {
        //if item is not saved
        if (inputTextField.text != ""){
            let unsavedItemAlert = UIAlertController(title: "Unsaved Item", message: "Discard unsaved item?"
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
