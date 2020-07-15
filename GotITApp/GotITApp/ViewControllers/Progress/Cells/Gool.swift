//
//  gool.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 13.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

 public struct Gool {
    let name: String
    let countOfDay: Double
    let begin: Double = 20
    func procent()->Double{
        return countOfDay/begin
    }
}

    var gool1 = Gool(name: "Alba1", countOfDay: 5)
    var gool2 = Gool(name: "Alba2", countOfDay: 7)
    var gool3 = Gool(name: "Alba3", countOfDay: 9)
    var gool4 = Gool(name: "Alba4", countOfDay: 11)
    var gool5 = Gool(name: "Alba5", countOfDay: 1)
    
    public var gools: [Gool] = [gool1, gool2, gool3, gool4, gool5]
    public var compleatedGools: [Gool] = []
    public var noCompleatedGools: [Gool] = []
