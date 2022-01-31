//
//  ViewController.swift
//  Prework
//
//  Created by LYON on 12/31/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var totalPartySizeLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var currencyLabel1: UILabel!
    @IBOutlet weak var currencyLabel2: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    // Picker data
    let pickerData = [String](arrayLiteral: "USD $","CNY ¥", "NFTs","BTC","GPB £","SGD $","JPY ¥","HKD $","EUR €","CAD $")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        
        // Set the title in navigation bar
        self.title = "Tip Calculator"
        
        // Set stepper
        partySizeStepper.wraps = true
        partySizeStepper.autorepeat = true
        partySizeStepper.maximumValue = 20
        
        currencyPicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
     @IBAction func calculateTip(_ sender: Any) {
         // Get bill amount from text field input
         let bill = Double(billAmountTextField.text!) ?? 0
        
         // Get total tip by multiplying tip * tipPerc
         let tipPercentage = [0.15, 0.18, 0.2]
    
         let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
         let total = bill + tip
        
         // Divide by party size
         let size = Double(partySizeStepper.value)
         // let size = Double(totalPartySizeLabel.text!) ?? 0
         let split = total / size
         
         // Update tip amount label
         tipAmountLabel.text = String(format: "%.2f", tip)
         // Update split amount
         splitLabel.text = String(format: "%.2f", split)
         // Update total amount
         totalLabel.text = String(format: "%.2f", total)
    }
    
    // Adjust Party Size
    @IBAction func partyStepper(_ sender: UIStepper) {
        totalPartySizeLabel.text = Int(sender.value).description
    }
    
    // Num. of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Num. of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // Return picker data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel1.text = pickerData[row]
        currencyLabel2.text = pickerData[row]
    }
}
