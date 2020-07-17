//
//  tokenManager.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 17.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

class tokenManager{
    var token: Double = 0;
    let key = "Token"
    
    init() {
        loadData()
    }
    
    func addToken(token: Double){
        self.token += token
    }
    
    func minusToken(token: Double){
        if self.token > token {
            self.token -= token
        }
    }
    
    private func loadData(){
        token = UserDefaults.standard.double(forKey: key)
    }
    
    private func save(){
        UserDefaults.standard.set(token, forKey: key)
    }
}
