//
//  NoCompleateViewCell.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 14.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class NoCompleateViewCell: UITableViewCell {
        
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var table: UITableView!
    
    weak var delegate: CellsDelegate?
    
        override func awakeFromNib() {
            super.awakeFromNib()
            
            title?.text = "No Compleated"
            table.delegate = self
            table.dataSource = self
            
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        func animate(cell: UITableViewCell, gool: NoCompleatedTask) {
            let shapeLayer = CAShapeLayer()
            let center = cell.contentView.convert(CGPoint(x: 330, y: 35), from: self)


            let trackLayer = CAShapeLayer()
            let circularPath = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
            
            trackLayer.path = circularPath.cgPath

            trackLayer.strokeColor = UIColor.lightGray.cgColor
            trackLayer.lineWidth = 5
            trackLayer.fillColor = UIColor.white.cgColor
            shapeLayer.lineCap = .round
            cell.contentView.layer.addSublayer(trackLayer)

            
            let circularPathProgress = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi*2, clockwise: true)
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

    extension NoCompleateViewCell: UITableViewDelegate{
        

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.selectionStyle = .none
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
                
                DataManager.shared.removeNoCompleatedTask(i: indexPath.row)
                self.delegate?.updateData()
                
            }
            let reDoAction = UIContextualAction(style: .normal, title: "ReDo") {  (contextualAction, view, boolValue) in
                
                DataManager.shared.reDo(i: indexPath.row)
                self.delegate?.updateData()
                
            }
            
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, reDoAction])

            return swipeActions
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        
    }

    extension NoCompleateViewCell: UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return DataManager.shared.noCompleatedTasks.count
           }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(tableView: UITableView) -> Int {
            return DataManager.shared.noCompleatedTasks.count
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
            let cell = UITableViewCell()
            
            
            cell.textLabel?.text = DataManager.shared.noCompleatedTasks[indexPath.section].name ?? nil
            
            cell.backgroundColor = #colorLiteral(red: 0.8634817004, green: 0.516028285, blue: 0.8076471686, alpha: 1)
            cell.layer.borderWidth = 0
            cell.layer.cornerRadius = 25
            cell.clipsToBounds = true
            
            animate(cell: cell, gool: (DataManager.shared.noCompleatedTasks[indexPath.section]))
            
            return cell
        }
        
        
    }
 extension NoCompleateViewCell: CellsUpdateProtocol{
     func reloadData() {
         table.reloadData()
     }
 }
