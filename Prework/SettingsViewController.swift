//
//  SettingsViewController.swift
//  Prework
//
//  Created by LYON on 10/31/21.
//

import UIKit

class SettingsViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tipPicker: UIPickerView!
    
    var numbers1 : [String] = []
    var numbers2 : [String] = []
    var numbers3 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1..<11 {
            numbers1.append(String(i))
        }
        for i in 11..<21 {
            numbers2.append(String(i))
        }
        for i in 21..<31 {
            numbers3.append(String(i))
        }
        
        tipPicker.delegate = self
        tipPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numbers1.count
        }
        else if component == 1{
            return numbers2.count
        }
        return numbers3.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return numbers1[row]
        }
        else if component == 1{
            return numbers2[row]
        }
        return numbers3[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
