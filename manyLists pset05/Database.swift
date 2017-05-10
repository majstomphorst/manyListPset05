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
    
    static let sharedinstance = Database()
    
    //MARK: SQL DATABASE
    private var connection: Connection?
    
    // creating Database properties
    private let id = Expression<Int64>("id")
    private let check = Expression<Bool>("check")
    private let todoText = Expression<String>("todoText")
    
    private init() {
        print("run")
        setupDatabase()
        createTable(tableName: "demo")
    }
    
    // creates the x.sqlite file database
    func setupDatabase() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(path)
        do {
            connection = try Connection("\(path)/manyListe.sqlite3")
        } catch {
            print("failed to create database")
        }
    }
    
    func createTable(tableName: String) {
        
        let nameOfTable = Table(tableName)
        
        do {
            try connection!.run(nameOfTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(check)
                t.column(todoText, unique: true)
            } )
        }  catch {
            print("faild to create table\(error)")
        }
    }
    
    
}
