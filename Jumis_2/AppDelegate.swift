//
//  AppDelegate.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 13/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var dbFunc = DBHelper()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        dbFunc.createTableUser()
        dbFunc.createTableTask()
        dbFunc.createTableUserTask()
        
        //Añadimos datos a la tabla User, Task y UserTask para contener datos en la APP
        var _ = User(USERID: 0, nombre: "", email: "", password: "", fecha_nacimiento: "")
        var _ = Task(TASKID: 0, nameTask: "", description: "", nameList: "", date: "", hour: "")
        var _ = UserTask(USERTASKID: 0, TASKUSERID: 0)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

