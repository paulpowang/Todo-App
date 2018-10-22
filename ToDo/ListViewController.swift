//
//  ViewController.swift
//  ToDo
//
//  Created by paul on 10/21/18.
//  Copyright © 2018 PoHung Wang. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var textNew: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textLabel.text = textNew
    }


}

