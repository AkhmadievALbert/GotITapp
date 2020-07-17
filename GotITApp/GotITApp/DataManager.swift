//
//  DataManager.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 16.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    static let shared = DataManager()
    
    var tasks = [Task]()
    
    var compleatedTasks = [CompleatedTask]()
    
    var noCompleatedTasks = [NoCompleatedTask]()
    
    private let tasksKey = "tasksKey"
    
    private let compleatedTasksKey = "compleateTasksKey"
    
    private let noCompleatedTasksKey = "noCompleateTasksKey"
    
    
    
    init(){
        loadData()
    }
    
    private func loadData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest1: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            tasks.removeAll()
            tasks.insert(contentsOf: try context.fetch(fetchRequest1), at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
        
        let fetchRequest2: NSFetchRequest<CompleatedTask> = CompleatedTask.fetchRequest()
        
        do{
            compleatedTasks.removeAll()
            compleatedTasks.insert(contentsOf: try context.fetch(fetchRequest2), at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
        
        let fetchRequest3: NSFetchRequest<NoCompleatedTask> = NoCompleatedTask.fetchRequest()
        
        do{
            noCompleatedTasks.removeAll()
            noCompleatedTasks.insert(contentsOf: try context.fetch(fetchRequest3), at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
    }
    
    func addTask(name: String, countOfday: Double, date: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {return}
        let taskObject = Task(entity: entity, insertInto: context)
        
        taskObject.name = name
        taskObject.countOfDay = countOfday
        taskObject.dateOfCreate = date
        
        do{
            try context.save()
            loadData()
            //tasks.insert(taskObject, at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
         //loadData()
    }
    
    func removeTask(i: Int){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "NoCompleatedTask", in: context) else {return}
        let noComplpeatedTaskObject = NoCompleatedTask(entity: entity, insertInto: context)
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        noComplpeatedTaskObject.name = tasks[i].name
        noComplpeatedTaskObject.countOfDay = tasks[i].countOfDay
        noComplpeatedTaskObject.dateOfCreate = tasks[i].dateOfCreate
        
        
        do{
            try context.delete(context.fetch(fetchRequest)[i])
            try context.save()
        }catch let err as NSError{
            print(err.localizedDescription)
        }
         loadData()
        
    }
    
    func removeCompleatedTask(i: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<CompleatedTask> = CompleatedTask.fetchRequest()
        
        do{
            try context.delete(context.fetch(fetchRequest)[i])
        }catch let err as Error{
            print(err.localizedDescription)
        }
        loadData()
        
    }
    
    func removeNoCompleatedTask(i: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NoCompleatedTask> = NoCompleatedTask.fetchRequest()
        
        do{
            try context.delete(context.fetch(fetchRequest)[i])
        }catch let err as Error{
            print(err.localizedDescription)
        }
        loadData()
    }
    
    func reDo(i: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {return}
        let taskObject = Task(entity: entity, insertInto: context)
        
        let fetchRequest: NSFetchRequest<NoCompleatedTask> = NoCompleatedTask.fetchRequest()
        taskObject.name = noCompleatedTasks[i].name
        taskObject.countOfDay = noCompleatedTasks[i].countOfDay
        taskObject.dateOfCreate = noCompleatedTasks[i].dateOfCreate
        
        
        do{
            try context.delete(context.fetch(fetchRequest)[i])
            try context.save()
        }catch let err as NSError{
            print(err.localizedDescription)
        }
         loadData()
        
        
    }
    
    func compleated(i: Int) {
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       let context = appDelegate.persistentContainer.viewContext
       
       guard let entity = NSEntityDescription.entity(forEntityName: "CompleatedTask", in: context) else {return}
       let complpeatedTaskObject = CompleatedTask(entity: entity, insertInto: context)
       
       let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
       complpeatedTaskObject.name = tasks[i].name
       complpeatedTaskObject.countOfDay = tasks[i].countOfDay
       complpeatedTaskObject.dateOfCreate = tasks[i].dateOfCreate
       
       
       do{
           try context.delete(context.fetch(fetchRequest)[i])
           try context.save()
       }catch let err as NSError{
           print(err.localizedDescription)
       }
        loadData()
    }
    
    private func save(){
        
    }
}


