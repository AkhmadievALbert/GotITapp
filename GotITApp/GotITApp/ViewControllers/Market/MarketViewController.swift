//
//  StoreVC.swift
//  GotItApp
//
//  Created by Admin on 09.07.2020.
//  Copyright © 2020 team1. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet var storeTableView: UITableView!
    
    var items: [Item] = [] 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = createArray()
        
        self.title = "Твоя коллекция"
    }
    

    
    func createArray() -> [Item] {
        let item1 = Item(image: #imageLiteral(resourceName: "jewelry"), title: "Аметист", price: 10)
        let item2 = Item(image: #imageLiteral(resourceName: "diamond"), title: "Топаз", price: 20)
        let item3 = Item(image: #imageLiteral(resourceName: "gem"), title: "Рубин", price: 50)
        let item4 = Item(image: #imageLiteral(resourceName: "sapphire"), title: "Сапфир", price: 100)
        let item5 = Item(image: #imageLiteral(resourceName: "emerald"), title: "Изумруд", price: 500)
        let item6 = Item(image: #imageLiteral(resourceName: "diamond"), title: "Бриллиант", price: 1000)
        
        return [item1, item2, item3, item4, item5, item6]
    }
}

extension MarketViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.setItem(item: item)
        
        return cell
    }
}
