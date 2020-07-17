//
//  ProgressViewCell.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 14.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit
import CoreData

class ProgressViewCell: UITableViewCell {
    
    let tokenManager = TokenManager()
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    weak var delegate: CellsDelegate?
  
    var tasks: [Task] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        title?.text = "Progress"
        table.delegate = self
        table.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func animate(cell: UITableViewCell, gool: Task) {
        
        let progress = gool.countOfDay / 2
        
        let shapeLayer = CAShapeLayer()
        let center = cell.contentView.convert(CGPoint(x: 330, y: 35), from: self)

            
        
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath

        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 5
        trackLayer.fillColor = UIColor.white.cgColor
        cell.contentView.layer.addSublayer(trackLayer)
    
        
        let label = CATextLayer()
        label.string = String (gool.countOfDay)
        label.fontSize = 14
        label.frame = CGRect(x: 0, y: 0, width: trackLayer.bounds.width, height: trackLayer.bounds.height)
        label.isHidden = false
        
        trackLayer.addSublayer(label)

        
        let circularPathProgress = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2 * CGFloat (gool.interval/gool.countOfDay) - CGFloat.pi/2, clockwise: true)
        shapeLayer.path = circularPathProgress.cgPath

        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 0.08010198921, blue: 0, alpha: 1)
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
    

        cell.contentView.layer.addSublayer(shapeLayer)
        
        load(shapeLayer: shapeLayer)

    }

    @objc private func load(shapeLayer: CAShapeLayer){
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")

        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey: "urSoBasic")

    }
}

extension ProgressViewCell: UITableViewDelegate{
    

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            TokenManager.minusToken(value: 10)
            DataManager.shared.removeTask(i: indexPath.section)
            self.delegate?.updateData()
            
        }
        
        let compleateAction = UIContextualAction(style: .normal, title: "Compleate") {  (contextualAction, view, boolValue) in
            
            TokenManager.addToken(value: DataManager.shared.tasks[indexPath.section].countOfDay*5)
            DataManager.shared.compleated(i: indexPath.section)
            self.delegate?.updateData()
            
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [compleateAction, deleteAction])
        
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension ProgressViewCell: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataManager.shared.tasks.count
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(tableView: UITableView) -> Int {
        return DataManager.shared.tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Task")
        
        
        cell.textLabel?.text = DataManager.shared.tasks[indexPath.section].name ?? nil
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
                   
        let dateString = dateFormatter.string(from: DataManager.shared.tasks[indexPath.section].dateOfCreate! as Date)
        cell.detailTextLabel?.text = dateString
        
        
        cell.backgroundColor = #colorLiteral(red: 0.47678262, green: 0.7897363305, blue: 0.6584587693, alpha: 1)
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
        
        animate(cell: cell, gool: (DataManager.shared.tasks[indexPath.section]))
        
        return cell
    }
    
    
}

extension ProgressViewCell: CellsUpdateProtocol{
    func reloadData() {
        table.reloadData()
    }
}
