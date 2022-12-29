//
//  DBHelper.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 22/12/22.
//

import Foundation
import SQLite3

class DBHelper{
     
    //MARK: Variables
    let dbPath: String = "DBJumis.sql"
    var db: OpaquePointer? {
        openDatabase()
    }
    
    //MARK: Open Database
    func openDatabase() -> OpaquePointer?
    {
       let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
           .appendingPathComponent(dbPath)
       var db: OpaquePointer? = nil
       if sqlite3_open(filePath.path, &db) != SQLITE_OK
       {
           debugPrint("can't open database")
           return nil
       }
       else
       {
           print("Successfully created connection to database at \(filePath.path)")
           return db
       }
   }
    
    //MARK: Create Tables
    func createTableUser() {
        let createTableString = "CREATE TABLE IF NOT EXISTS User(USERID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL, fecha_nacimiento DATE NOT NULL);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
           if sqlite3_step(createTableStatement) == SQLITE_DONE
           {
               print("User table created.")
           } else {
               print("User table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func createTableTask() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Task(TASKID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nameTask TEXT NOT NULL, description VARCHAR(200) NOT NULL, nameList TEXT NOT NULL, date DATE NOT NULL, hour TIME NOT NULL);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Task table created.")
            } else {
                print("Task table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func createTableUserTask(){
        let createTableString = "CREATE TABLE IF NOT EXISTS UserTask(USERTASKID INTEGER NOT NULL, TASKUSERID TEXT NOT NULL, FOREIGN KEY('USERTASKID') REFERENCES 'User'('USERID'), FOREIGN KEY('TASKUSERID') REFERENCES 'Task'('TASKID'), PRIMARY KEY('USERTASKID','TASKUSERID'));"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("UserTask table created.")
            } else {
                print("UserTask table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    //MARK: Insert Data
    func insertUser(nombre:String, email:String, pass:String, fecha_nac: String)
    {
        var idInsert = idUser()
        print(idInsert)
        let insertStatementString = "INSERT INTO User (USERID, nombre, email, password, fecha_nacimiento) VALUES (?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(idInsert+1))
            sqlite3_bind_text(insertStatement, 2, (nombre as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (pass as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (fecha_nac as NSString).utf8String, -1, nil)
           
           if sqlite3_step(insertStatement) == SQLITE_DONE {
               print("Successfully inserted row.")
           } else {
               print("Could not insert row.")
           }
       } else {
           print("INSERT statement could not be prepared.")
       }
       sqlite3_finalize(insertStatement)
    }
    
    func insertTask(id: Int, nameTask: String, description: String, nameList: String, date: String, hour: String ){
        let insertStatementString = "INSERT INTO Task (TASKID, nameTask, description, nameList, date, hour) VALUES (?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (nameTask as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (nameList as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (date as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (hour as NSString).utf8String, -1, nil)
           
           if sqlite3_step(insertStatement) == SQLITE_DONE {
               print("Successfully inserted row.")
           } else {
               print("Could not insert row.")
           }
       } else {
           print("INSERT statement could not be prepared.")
       }
       sqlite3_finalize(insertStatement)
    }
    
    //MARK: Id
    func idUser() -> Int32{
        let queryStatementString = "SELECT USERID FROM User ORDER BY USERID DESC LIMIT 1;"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let userid = sqlite3_column_int(queryStatement, 0)
                sqlite3_finalize(queryStatement)
                return userid
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return 0
    }
    
    //MARK: Select
    func readUsers()  {
        let queryStatementString = "SELECT * FROM User;"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
           while sqlite3_step(queryStatement) == SQLITE_ROW {
               let userid = sqlite3_column_int(queryStatement, 0)
               let email = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
               let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
               print("Query Result:")
               print("\(userid) | \(email) | \(password)")
           }
        } else {
           print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
    }
    
    func existsUser(email:String) -> String{
        let queryStatementString = "SELECT * FROM User WHERE email =\(email);"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
           while sqlite3_step(queryStatement) == SQLITE_ROW {
               let emailConsult = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
               print(emailConsult)
               sqlite3_finalize(queryStatement)
               return emailConsult
           }
        } else {
           print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return "-1"
    }
    
    func existsUserLogin(email:String, pass:String) -> Bool{
        let queryStatementString = "SELECT * FROM User WHERE email =\(email) and password=\(pass);"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
           while sqlite3_step(queryStatement) == SQLITE_ROW {
               sqlite3_finalize(queryStatement)
               return true
           }
        } else {
           print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return false
    }
    
         
    //MARK: Drop/Delete
    func dropTable(table: String) {
        let deleteStatementStirng = "DROP TABLE IF EXISTS \(table);"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
           if sqlite3_step(deleteStatement) == SQLITE_DONE {
               print("Successfully deleted.")
           } else {
               print("Could not delete")
           }
        } else {
           print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func deleteByID(table:String, id:Int) {
        let deleteStatementStirng = "DELETE FROM \(table) WHERE USERID = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
}

