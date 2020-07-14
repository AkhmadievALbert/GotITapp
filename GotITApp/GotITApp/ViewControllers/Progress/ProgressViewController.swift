//
//  ProgressViewController.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 11.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressViewCell") as! ProgressViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompleateViewCell") as! CompleateTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoCompleateViewCell") as! NoCompleateViewCell
            return cell
        }
    }
    
    func registerNibs(){
        tableView.register(UINib(nibName: "ProgressViewCell", bundle: nil), forCellReuseIdentifier: "ProgressViewCell")
        tableView.register(UINib(nibName: "CompleateTableViewCell", bundle: nil), forCellReuseIdentifier: "CompleateViewCell")
        tableView.register(UINib(nibName: "NoCompleateViewCell", bundle: nil), forCellReuseIdentifier: "NoCompleateViewCell")
    
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        registerNibs()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Alba")
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none 
    }
}
