//
//  ProgressViewCell.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 14.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class ProgressViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    var tasks: [String] = ["Alba1", "Alba2"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title?.text = "Progress"
        table.delegate = self
        table.dataSource = self
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProgressViewCell: UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Deleate") { (action, IndexPath) in
            self.tasks.remove(at: IndexPath.row)
            self.table.deleteRows(at: [IndexPath], with: .automatic)
        }
        return [deleteAction]
    }
}

extension ProgressViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}
