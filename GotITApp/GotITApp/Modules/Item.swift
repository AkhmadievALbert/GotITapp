//
//  Item.swift
//  GotItApp
//
//  Created by Admin on 09.07.2020.
//  Copyright © 2020 team1. All rights reserved.
//

import Foundation
import UIKit

class Item {
    var image: UIImage
    var title: String
    var price: Int
    
    init(image: UIImage, title: String, price: Int) {
        self.image = image
        self.title = title
        self.price = price
    }
    
}
