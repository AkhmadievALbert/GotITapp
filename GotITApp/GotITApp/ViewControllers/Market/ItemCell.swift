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
    
    var price: Double!
    
    @IBAction func buyItem(_ sender: Any) {
        print(self.price!)
        print(TokenManager.token)
        if TokenManager.token >= self.price! && !TokenManager.items.contains(nameLabel.text!) {
            TokenManager.buyItem(name: nameLabel.text!)
            TokenManager.minusToken(value: self.price)
            changeButtonTitle()
            UIApplication.shared.keyWindow?.rootViewController?.viewWillAppear(false)
            //print(tokenManager.items)
        } else {
            notEnoughTokens()
        }
    
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
        self.price = Double(item.price)
        
        if TokenManager.items.contains(item.title) {
            changeButtonTitle()
        } else {
            itemButton.setTitle("\(item.price) 💰", for: .normal)
        }
    }
    
    func notEnoughTokens() {
        let alertController = UIAlertController(title: "Ошибка", message: "Недостаточно монет", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
