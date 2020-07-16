//
//  Task.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 15.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

struct Task {
    
    let nameOfTask: String
    
    let dateOfCreate: Date
    
    let countOfDay: Double
    
    var interval: TimeInterval
    
    func precentOfDays() -> Double{
        return interval / countOfDay
    }
    
}
