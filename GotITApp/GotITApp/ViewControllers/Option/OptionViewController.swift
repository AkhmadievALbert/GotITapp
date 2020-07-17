//
//  OptionViewController.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 11.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit
import UserNotifications

class OptionViewController: UIViewController {
  
    let notifyCentre = UNUserNotificationCenter.current()
     @IBOutlet weak var Settings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func Settings(_ sender: Any) {
        let alertController = UIAlertController(title: "Внимание!", message: "Перейти в настройки?", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else{
            return
            }
            if UIApplication.shared.canOpenURL(settingsUrl){
                UIApplication.shared.open(settingsUrl, completionHandler: {(success) in
                    print("Settings opened: \(success)")
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
   
    
    
    
    func sendNotification(){
        let centre = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Внимание!"
        content.subtitle = "У вас есть незавершенные цели"
        content.body = "Не забывайте отслеживать их выполнение!"
        content.sound = UNNotificationSound.default
       
        let date = Date().addingTimeInterval(1)
        
        let dataComp = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second],
                                                       from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dataComp, repeats: false)
        
        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
        
        centre.add(request){(error) in
            if error != nil{
                print(error)
            }
            
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
