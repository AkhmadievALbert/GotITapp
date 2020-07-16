//
//  OptionViewController.swift
//  GotITApp
//
//  Created by Albert Ahmadiev on 11.07.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {
    @IBOutlet weak var switchOn: UISwitch!
    let notifyCentre = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Switching(_ sender: Any) {
        
        if switchOn.isOn {

            let options: UNAuthorizationOptions = [.alert,.sound,.badge]
            
            notifyCentre.requestAuthorization(options: options)
            { (wasAllowed, Error) in
                if !wasAllowed {
                print("User has declined notifications")
                    
                }
            }
                
            
            print("Notifications is allowed")
        }
        else{
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            print("Notifications was declined")
        }
    }
    
    func sendNotification(){
        let centre = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Время истекло!"
        content.subtitle = "Вы справились с поставленной задачей?"
        content.body = "Ваше время на выполнение цели закончилось!"
        content.sound = UNNotificationSound.default
       
        let date = Date().addingTimeInterval(4)
        
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
