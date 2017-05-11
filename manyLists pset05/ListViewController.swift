//
//  ViewController.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 10/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit
import SQLite


class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    
    // let lst = ["row1","row2"]
    
    // store the concent of the database only the "todoText" field
    var concentDatabase = [String]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        concentDatabase = Database.shared.readDatabase(witchTable: Database.shared.listTable, witchColum: Database.shared.list)
        
        
        self.listTableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concentDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        cell.listCell.text = concentDatabase[indexPath.row]
        
        return cell
    }
    
    

}

