//
//  ViewController.swift
//  Prework
//
//  Created by LYON on 12/31/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var totalPartySizeLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!

    let userDefaults = UserDefaults()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        
        // Set numberPad
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        
        // Set the title in navigation bar
        self.title = "Tip Calculator"
        
        // Set stepper
        partySizeStepper.wraps = true
        partySizeStepper.autorepeat = true
        partySizeStepper.minimumValue = 1
        partySizeStepper.maximumValue = 20
        
        // Save data when closed app
        billAmountTextField.delegate = self
        
        if let value = userDefaults.value(forKey: "billAmount") as? String {
            billAmountTextField.text = value
        }
        
        // UI animated
        billAmountTextField.alpha = 0
        tipAmountLabel.alpha = 0
        splitLabel.alpha = 0
        totalLabel.alpha = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userDefaults.setValue(billAmountTextField.text, forKey: "billAmount")
        billAmountTextField.resignFirstResponder()
        return true
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
         
         // Update locale-specific currency and currency thousands separators
         let formatter = NumberFormatter()
         formatter.locale = Locale.current
         formatter.numberStyle = .currency
         
         // Update tip amount label
         if let formattedTipAmount = formatter.string(from: tip as NSNumber) {
             tipAmountLabel.text = formattedTipAmount
         }
         // Update split amount
         if let formattedSplitAmount = formatter.string(from: split as NSNumber) {
             splitLabel.text = formattedSplitAmount + " each"
         }
         // Update total amount
         if let formattedTotalAmount = formatter.string(from: total as NSNumber) {
             totalLabel.text = formattedTotalAmount
         }
    }
    
    // Adjust Party Size
    @IBAction func partyStepper(_ sender: UIStepper) {
        totalPartySizeLabel.text = Int(sender.value).description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        UIView.animate(withDuration: 1, animations:{ self.billAmountTextField.alpha = 0.6
        }) { (true) in self.showTip()
        }
    }
    
    func showTip() {
        UIView.animate(withDuration: 1, animations:{ self.tipAmountLabel.alpha = 0.6
        }) { (true) in self.showSpilt()
        }
    }
    
    func showSpilt() {
        UIView.animate(withDuration: 1, animations:{ self.splitLabel.alpha = 0.6
        }) { (true) in self.showTotal()
        }
    }
    func showTotal() {
        UIView.animate(withDuration: 1, animations:{ self.totalLabel.alpha = 0.6
        })
    }
}
