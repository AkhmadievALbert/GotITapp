//
//  CompleateTableViewCell.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 14.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class CompleateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    weak var delegate: CellsDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            title?.text = "Compleated"
            table.delegate = self
            table.dataSource = self
          
            
        }
    
        

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        func animate(cell: UITableViewCell, gool: CompleatedTask) {
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

            shapeLayer.strokeColor = #colorLiteral(red: 0.373221159, green: 0.9422872663, blue: 0.3649424314, alpha: 1)
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

    extension CompleateTableViewCell: UITableViewDelegate{
        

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.selectionStyle = .none
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in

                DataManager.shared.removeCompleatedTask(i: indexPath.row)
                self.delegate?.updateData()
            }
            
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

            return swipeActions
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        
    }

    extension CompleateTableViewCell: UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return DataManager.shared.compleatedTasks.count
           }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(tableView: UITableView) -> Int {
            return DataManager.shared.compleatedTasks.count
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
            
            
            cell.textLabel?.text = DataManager.shared.compleatedTasks[indexPath.section].name ?? nil
            
            cell.backgroundColor = #colorLiteral(red: 0.373221159, green: 0.9422872663, blue: 0.3649424314, alpha: 1)
            cell.layer.borderWidth = 0
            cell.layer.cornerRadius = 25
            cell.clipsToBounds = true
            
            animate(cell: cell, gool: (DataManager.shared.compleatedTasks[indexPath.section]))
            
            return cell
        }
        
        
    }

extension CompleateTableViewCell: CellsUpdateProtocol{
    func reloadData() {
        table.reloadData()
    }
}
