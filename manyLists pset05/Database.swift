//
//  Database.swift
//  manyLists pset05
//
//  Created by Maxim Stomphorst on 10/05/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import Foundation
import SQLite

class Database {
    
    static let shared = Database()
    
    //MARK: SQL Database
    private var connection: Connection?
    
    // creating tables properties
    let todoTable = Table("todoTable")
    let listTable = Table("listTable")
    
    // creating colum properties
    let id = Expression<Int64>("id")
    let check = Expression<Bool>("check")
    let todoText = Expression<String>("todoText")
    let list = Expression<String>("list")
    
    
    private init() {
        // creating the database
        setupDatabase()
        createTables()
    }
    
    // sets up the database and creats the table in the database (it call the function createTable)
    func setupDatabase() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            connection = try Connection("\(path)/db.sqlite3")
        } catch {
            print("Cant connect to database:\(error)")
        }
    }
    
    // creats the tabels in a database file
    func createTables() {
        do {
            try connection!.run(todoTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(check)
                t.column(todoText, unique: true)
                t.column(list)
            } )
        } catch {
            print("faild to create table\(error)")
        }
        
        
        do {
            try connection!.run(listTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(list, unique: true)
            } )
        } catch {
            print("faild to create table\(error)")
        }
        
    }
   
    func readDatabase(witchTable: Table, witchColum: Expression<String>) -> [String] {
        
        var concentOfDatabase = [String]()
        
        do {
            for item in try connection!.prepare(witchTable) {
                concentOfDatabase.append(item[witchColum])
            }
            
        } catch {
            print("read database failed \(error)")
        }
        
        return concentOfDatabase
    }
    
    func readDatabase(witchTable: Table, witchColum: Expression<String>, witchList: String) -> [String] {
        
        var concentOfDatabase = [String]()
        
        let query = witchTable.select(witchColum)           // SELECT "email" FROM "users"
            .filter(Database.shared.list == witchList)     // WHERE "name" IS NOT NULL
        
        
        do {
            for item in try connection!.prepare(query) {
                concentOfDatabase.append(item[witchColum])
            }
            
        } catch {
            print("read database failed \(error)")
        }
        
        return concentOfDatabase
    }
    
    
    func rideListTableDatabase(text: String) {
        
        let insert = listTable.insert(list <- text)
        
        do {
            try connection!.run(insert)
        } catch {
            print("database insertion failed\(error)")
        }
    }
    
    func rideTodoTableDatabase(text: String, table: String, completed: Bool = false) {
        let insert = todoTable.insert(todoText <- text, list <- table, check <- completed)
        
        do {
            try connection!.run(insert)
        } catch {
            print("database insertion failed\(error)")
        }
    }
    
    func dropRow(witchTable: Table, witchColum: Expression<String>, text: String) {
        
        let dropRow = witchTable.filter(witchColum == text)
        do {
            try connection!.run(dropRow.delete())
        } catch {
            print("error with deleting")
        }
    }
    
    func readCheckTodoDatabase(witchList: String) -> [Bool] {
        
        var concent = [Bool]()
        
        let query = todoTable.select(check)           // SELECT "email" FROM "users"
            .filter(Database.shared.list == witchList)     // WHERE
        
        
        do {
            for item in try connection!.prepare(query) {
                concent.append(item[check])
            }
            
        } catch {
            print("read  (bool) database failed \(error)")
        }
        
        return concent
    }
    
    func updateDoneTodoDatabase(text: String) {
        var checking = Int()
        
        let change = todoTable.filter(todoText == text && check == false)
        do {
            checking = try connection!.run(change.update(check <- true))
            
        } catch {
            print("update1 fout")
        }
        
        if checking == 0 {
            let change = todoTable.filter(todoText == text && check == true)
            do {
                checking = try connection!.run(change.update(check <- false))
            } catch {
                print("update2 fout")
            }
            
       }
        
    }
        

    
}
