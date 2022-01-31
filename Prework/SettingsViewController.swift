//
//  SettingsViewController.swift
//  Prework
//
//  Created by LYON on 10/31/21.
//

import UIKit

class SettingsViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        let appDelegate = UIApplication.shared.windows.first
        
        if sender.isOn {
            appDelegate?.overrideUserInterfaceStyle = .dark
            return
        }
        appDelegate?.overrideUserInterfaceStyle = .light
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
