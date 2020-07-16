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
    
    var tasks = [Task]()
    
    var compleatedTasks = [Task]()
    
    var noCompleatedTasks = [Task]()
    
    private let tasksKey = "tasksKey"
    
    private let compleatedTasksKey = "compleateTasksKey"
    
    private let noCompleatedTasksKey = "noCompleateTasksKey"
    
    
    
    init(){
        loadData()
    }
    
    private func loadData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            tasks.insert(contentsOf: try context.fetch(fetchRequest), at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
    }
    
    func addTask(name: String, countOfday: Double, date: Date){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {return}
        let taskObject = Task(entity: entity, insertInto: context)
        
        taskObject.name = name
        taskObject.countOfDay = countOfday
        taskObject.dateOfCreate = date
        
        do{
            try context.save()
            tasks.insert(taskObject, at: 0)
        }catch let err as NSError{
            print(err.localizedDescription)
        }
         loadData()
    }
    
    func removeTask(i: Int){
        
        noCompleatedTasks.append(tasks[i])
        tasks.remove(at: i)
        save()
        
    }
    
    func removeCompleatedTask(i: Int){
        
        
        
    }
    
    func removeNoCompleatedTask(i: Int){
        
        
        
    }
    
    func reDo(i: Int){
        
        
        
    }
    
    func compleated(i: Int) {
       
    }
    
    private func save(){
        
    }
}


