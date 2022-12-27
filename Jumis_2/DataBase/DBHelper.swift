//
//  DBHelper.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 22/12/22.
//

import Foundation
import SQLite3

class DBHelper{
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        var databasePointer: OpaquePointer?
        
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(databaseName).path
        
        if FileManager.default.fileExists(atPath: documentDatabasePath){
            print("Database exists (alredy)")
        } else {
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent(databaseName).path else {
                print("Error: Database Path doesn´t exist")
                return nil
            }
            
            do {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Database created (copied)")
            } catch {
                    print("Error: \(error.localizedDescription)")
                    return nil
            }
        }
        
        if sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK {
            print("Succesfully open database")
            print("Database path: \(documentDatabasePath)")
        } else {
            print("Could not open database")
        }
        
        return databasePointer
    }
}

