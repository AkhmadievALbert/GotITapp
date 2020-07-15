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
    
        override func awakeFromNib() {
            super.awakeFromNib()
            
            title?.text = "No Compleated"
            table.delegate = self
            table.dataSource = self
          
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        func animate(cell: UITableViewCell, gool: Gool) {
            let shapeLayer = CAShapeLayer()
            let center = cell.contentView.convert(CGPoint(x: 330, y: 35), from: self)


            let trackLayer = CAShapeLayer()
            let circularPath = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: 2*CGFloat.pi, clockwise: true)
            
            trackLayer.path = circularPath.cgPath

            trackLayer.strokeColor = UIColor.lightGray.cgColor
            trackLayer.lineWidth = 5
            trackLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineCap = .round
            cell.contentView.layer.addSublayer(trackLayer)

            
            let circularPathProgress = UIBezierPath(arcCenter: center, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi*2*CGFloat(gool.procent()), clockwise: true)
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

    extension NoCompleateViewCell: UITableViewDelegate{
        

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.selectionStyle = .none
        }
        
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in

                compleatedGools.remove(at: indexPath.row)
                self.table.deleteSections([indexPath.section], with: .automatic)
            }
            let reDoAction = UIContextualAction(style: .normal, title: "ReDo") {  (contextualAction, view, boolValue) in
                
                gools.append(noCompleatedGools[indexPath.row])
                
                noCompleatedGools.remove(at: indexPath.row)
                self.table.deleteSections([indexPath.section], with: .automatic)
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
            return noCompleatedGools.count
           }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(tableView: UITableView) -> Int {
            return noCompleatedGools.count
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
            
            
            cell.textLabel?.text = compleatedGools[indexPath.section].name
            
            cell.backgroundColor = #colorLiteral(red: 0.8634817004, green: 0.516028285, blue: 0.8076471686, alpha: 1)
            cell.layer.borderWidth = 0
            cell.layer.cornerRadius = 25
            cell.clipsToBounds = true
            
            animate(cell: cell, gool: noCompleatedGools[indexPath.section])
            
            return cell
        }
        
        
    }
