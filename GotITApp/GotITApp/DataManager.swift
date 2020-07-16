//
//  DataManager.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 16.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

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
        
        let dataTasks = UserDefaults.standard.array(forKey: tasksKey) as? [Task] ?? []
        tasks = dataTasks
        
        let dataCompleatedTasks = UserDefaults.standard.array(forKey: compleatedTasksKey) as? [Task] ?? []
        compleatedTasks = dataCompleatedTasks
        
        let dataNoCompleatedTasks = UserDefaults.standard.array(forKey: noCompleatedTasksKey) as? [Task] ?? []
        noCompleatedTasks = dataCompleatedTasks

    }
    
    func addTask(task: Task){
        tasks.append(task)
        save()
    }
    
    func removeTask(i: Int){
        
        noCompleatedTasks.append(tasks[i])
        tasks.remove(at: i)
        save()
        
    }
    
    func removeCompleatedTask(i: Int){
        
        compleatedTasks.remove(at: i)
        save()
        
    }
    
    func removeNoCompleatedTask(i: Int){
        
        noCompleatedTasks.remove(at: i)
        save()
        
    }
    
    func reDo(i: Int){
        
        addTask(task: noCompleatedTasks[i])
        noCompleatedTasks.remove(at: i)
        save()
        
    }
    
    func compleated(i: Int) {
        compleatedTasks.append(tasks[i])
        tasks.remove(at: i)
        save()
    }
    
    private func save(){
        UserDefaults.standard.set(tasks, forKey: tasksKey)
        UserDefaults.standard.set(compleatedTasks, forKey: compleatedTasksKey)
        UserDefaults.standard.set(noCompleatedTasks, forKey: noCompleatedTasksKey)
    }
}


