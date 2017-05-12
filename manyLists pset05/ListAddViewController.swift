//
//  ListAddViewController.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 11/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class ListAddViewController: UIViewController {

    
    @IBOutlet weak var addListField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: actions
    @IBAction func addListButton(_ sender: Any) {
        Database.shared.rideListTableDatabase(text: addListField.text!)
        addListField.text = ""
    }
    



}
