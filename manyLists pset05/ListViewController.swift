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
    
    // store the concent of the database only the "todoText" field
    var concentDatabase = [String]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        concentDatabase = Database.shared.readDatabase(witchTable: Database.shared.listTable, witchColum: Database.shared.list)
        
        self.listTableView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "todoSegue" {
//            if let indexPath = listTableView.indexPathForSelectedRow {
//                let destVC = segue.destination as! TodoViewController
//                destVC.tableLocation = concentDatabase[indexPath.row]
//            }
//        }
//    }
    
    
    //MARK: tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concentDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        cell.listCell.text = concentDatabase[indexPath.row]
        
        return cell
    }
    
    // checking if item may be edited always true
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // handle delete (by removing the data from the database and updating the tableview)
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            Database.shared.dropRow(witchTable: Database.shared.listTable, witchColum: Database.shared.list, text: concentDatabase[indexPath.row])
        }
        
        concentDatabase = Database.shared.readDatabase(witchTable: Database.shared.listTable, witchColum: Database.shared.list)
        
        self.listTableView.reloadData()
        
    }
    

}

