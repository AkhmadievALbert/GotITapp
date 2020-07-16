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

