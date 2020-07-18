//
//  tokenManager.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 17.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import Foundation

class TokenManager{
    static var token: Double = 0;
    static let key = "Token"
    static var items = [String]()
    static let keyItems = "Items"
    
    init() {
    }
    
    static func addToken(value: Double){
        TokenManager.token += value
        save()
    }
    
    static func minusToken(value: Double){
        
        TokenManager.token -= value
        save()
    }
    
    static func loadData() {
        TokenManager.token = UserDefaults.standard.double(forKey: TokenManager.key)
        TokenManager.items = UserDefaults.standard.array(forKey: keyItems) as? [String] ?? [String]()
    }
    
    static func buyItem(name: String){
        print("\(name) added")
        TokenManager.items.append(name)
        save()
    }
    
    private static func save() {
        print(TokenManager.items)
        
        UserDefaults.standard.set(TokenManager.token, forKey: key)
        UserDefaults.standard.set(TokenManager.items, forKey: keyItems)
    }
    

}
