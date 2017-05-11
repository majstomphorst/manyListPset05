//
//  TodoViewController.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 11/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    let lst = ["Dog","Cat"]
    
    var tableLocation = String()
    
    @IBOutlet weak var todoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        
        cell.addCell.text = lst[indexPath.row]
        
        return cell
    }

}
