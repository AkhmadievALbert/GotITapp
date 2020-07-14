//
//  ItemCell.swift
//  GotItApp
//
//  Created by Admin on 10.07.2020.
//  Copyright © 2020 team1. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {


    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemButton: UIButton!
    
    @IBAction func buyItem(_ sender: Any) {
        itemButton.setTitle("Куплено", for: .normal)
        itemButton.setTitleColor(.gray, for: .normal)
        itemButton.titleLabel!.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        itemButton.titleLabel!.adjustsFontSizeToFitWidth = true
        
    }
    
    func setItem(item: Item) {
        itemImageView.image = item.image
        nameLabel.text = item.title

        itemButton.setTitle("\(item.price) 💰", for: .normal)
    }
}
