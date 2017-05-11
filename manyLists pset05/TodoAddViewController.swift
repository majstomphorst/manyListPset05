//
//  TodoAddViewController.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 11/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class TodoAddViewController: UIViewController {
    
    var list = String()
    
    @IBOutlet weak var addTodoField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(list)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTodoButton(_ sender: Any) {
        print("button click addTodoButton")
    }
    
    

}
