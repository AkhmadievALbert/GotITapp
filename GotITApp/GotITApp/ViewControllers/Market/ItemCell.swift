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
    
    static var price: Double = 0
    
    @IBAction func buyItem(_ sender: Any) {
        if !TokenManager.items.contains(nameLabel.text!) && TokenManager.token >= ItemCell.price {
            TokenManager.buyItem(name: nameLabel.text!)
            //print(tokenManager.items)
        } else {
            
        }
        
        changeButtonTitle()
    }
    
    func changeButtonTitle() {
        itemButton.setTitle("Куплено", for: .normal)
        itemButton.setTitleColor(.gray, for: .normal)
        itemButton.titleLabel!.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        itemButton.titleLabel!.adjustsFontSizeToFitWidth = true
    }
    
    func setItem(item: Item) {
        itemImageView.image = item.image
        nameLabel.text = item.title
        ItemCell.price = Double(item.price)
        
        if TokenManager.items.contains(item.title) {
            changeButtonTitle()
        } else {
            itemButton.setTitle("\(item.price) 💰", for: .normal)
        }
    }
    
    func notEnoughTokensAlert() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        let _: Void = MarketViewController()
        .present(alertController, animated: true, completion: nil)
    }
}
