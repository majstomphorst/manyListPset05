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
    private let todoTable = Table("todoTable")
    private let listTable = Table("listTable")
    
    // creating colum properties
    private let id = Expression<Int64>("id")
    private let check = Expression<Bool>("check")
    private let todoText = Expression<String>("todoText")
    private let list = Expression<String>("list")
    
    
    private init() {
        // creating the database
        setupDatabase()
        createToDoTable()
        createListTable()
    }
    
    // sets up the database and creats the table in the database (it call the function createTable)
    func setupDatabase() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(path)
        do {
            connection = try Connection("\(path)/db.sqlite3")
        } catch {
            print("Cant connect to database:\(error)")
        }
    }
    
    // creats the tabels in a database file
    func createToDoTable() {
        do {
            try connection!.run(todoTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(check)
                t.column(todoText, unique: true)
            } )
        } catch {
            print("faild to create table\(error)")
        }
    }
    
    func createListTable() {
        do {
            try connection!.run(listTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(list, unique: true)
            } )
        } catch {
            print("faild to create table\(error)")
        }
    }
    
    func readListTableDatabase() -> [String] {
        
        var concentOfDatabase = [String]()
        
        do {
            for item in try connection!.prepare(listTable) {
                concentOfDatabase.append(item[todoText])
            }
            
        } catch {
            print("read database failed \(error)")
        }
        
        return concentOfDatabase
    }
    
    func readTodoTableDatabase() -> [String] {
        
        var concentOfDatabase = [String]()
        
        do {
            for item in try connection!.prepare(todoTable) {
                concentOfDatabase.append(item[list])
            }
            
        } catch {
            print("read database failed \(error)")
        }
        
        return concentOfDatabase
    }
        

    
}
