//
//  TodoViewController.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 11/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    var concentDatabase = [String]()
    
    var tableLocation = String()
    
    @IBOutlet weak var todoTableView: UITableView!
    
    
    // addNewtTodoSegue
    override func viewDidAppear(_ animated: Bool) {
        // concentDatabase = Database.shared.readDatabase(witchTable: Database.shared.todoTable, witchColum: Database.shared.todoText)
        
        concentDatabase = Database.shared.readDatabase(witchTable: Database.shared.todoTable, witchColum: Database.shared.todoText, witchList: tableLocation)
        
        
        self.todoTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewtTodoSegue" {
                let destVC = segue.destination as! todoAddViewController
                destVC.tableLocation = tableLocation
        }
    }
    
    //MARK: tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concentDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        cell.addCell.text = concentDatabase[indexPath.row]
        
        return cell
    }
    
    // checking if item may be edited always true
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // action is delete is pressed
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // handle delete (by removing the data from the database and updating the tableview)
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
        }
        
        
        
    }
    

}
