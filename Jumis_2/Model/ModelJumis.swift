//
//  ModelJumis.swift
//  Jumis
//
//  Created by Isaac Marroquí Penalva on 30/12/22.
//

import Foundation

class Task{
    var TASKID: Int32
    var nameTask: String
    var description: String
    var nameList: String
    var date: String
    var hour: String
    var dbFunc = DBHelper()
    
    init(TASKID: Int32, nameTask: String, description: String, nameList: String, date: String, hour: String) {
        self.TASKID = TASKID
        self.nameTask = nameTask
        self.description = description
        self.nameList = nameList
        self.date = date
        self.hour = hour
        
        dbFunc.insertTask(id: 1, nameTask: "Tarea UCAM" , description: "Acabar trabajo de iOS", nameList: "Lista de tareas", date: "16/01/2023", hour: "23:59")
        dbFunc.insertTask(id: 2, nameTask: "Tarea UCAM" , description: "Acabar trabajo de iOS", nameList: "Lista de tareas", date: "16/01/2023", hour: "23:59")
        dbFunc.insertTask(id: 3, nameTask: "Tarea de casa" , description: "Limpieza general", nameList: "Lista de tareas", date: "01/01/2023", hour: "8:00") //Esta tarea no será asignada a ningún usuario para probar que solo se asignan las que hemos insertado en la clase UserTask
    }
}

class UserTask {
    var USERTASKID: Int32
    var TASKUSERID: Int32
    var dbFunc = DBHelper()
    
    init(USERTASKID: Int32, TASKUSERID: Int32) {
        self.USERTASKID = USERTASKID
        self.TASKUSERID = TASKUSERID
        
        dbFunc.insertUserTask(usertaskid: 1, taskuserid: 1) //Introducimos la tarea con id 1 en el usuario que se registre con el id 1
        dbFunc.insertUserTask(usertaskid: 2, taskuserid: 2) //Introducimos la tarea con id 2 en el usuario que se registre con el id 2
    }
}
