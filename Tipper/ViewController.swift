//
//  ViewController.swift
//  Tipper
//
//  Created by VASILIOS KARLIS on 2/8/16.
//  Copyright © 2016 VASILIOS KARLIS. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {

    @IBOutlet weak var txtStartBillAmt: UITextField?
    @IBOutlet weak var txtNumberOfPeopltToSplitBetween: UITextField!
    @IBOutlet weak var stepperSplitBetweenPeople: UIStepper!
    @IBOutlet weak var txtPercentTip: UITextField!
    @IBOutlet weak var txtPerPersonAmount: UITextField!
    @IBOutlet weak var txtTotalTipAmount: UITextField!
    @IBOutlet weak var txtTotalAmountWithTip: UITextField!
    @IBOutlet weak var border: UILabel!
   
    var beginningBilLAmount = Float(0.0)
    
    
    
    
    @IBAction func AmtEditingBegan(_ sender: UITextField) {
        txtStartBillAmt!.text = ""
        
    }
    @IBAction func txtBillAmtAction(_ sender: UITextField) {
      //  txtStartBillAmt!.text = Float(txtStartBillAmt!.text!) ?? 0
        
        if txtStartBillAmt!.text!.isEmpty {
            txtStartBillAmt!.text = "0"
            
        }
        beginningBilLAmount = Float(txtStartBillAmt!.text!)!
         txtStartBillAmt!.text! = "$" + String(format: "%.2f", beginningBilLAmount)
        CalculateTotals()
        
        
    }
    
    //Increment the number of people to split the bill
    @IBAction func stepperIncrementNumberOfPeopeToSplitBetween(_ sender: UIStepper) {
        txtNumberOfPeopltToSplitBetween.text =  Int( sender.value).description
        CalculateTotals()
        dismissKeyboard()
    }
    //  Increment the percent for tip
    @IBAction func stepperPercentTip(_ sender: UIStepper) {
        txtPercentTip.text = Int(sender.value).description
        CalculateTotals()
        dismissKeyboard()
    }
      
   
 

    // Calculate the fields
    func CalculateTotals(){
        
 
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
        
        
        
       let NumberOfPeople = Float(txtNumberOfPeopltToSplitBetween!.text!)
       let PercentTip = Float(txtPercentTip!.text!)
        
       // Calculate Per Person Amount
        txtPerPersonAmount.text = "$" +  String(format: "%.2f", (beginningBilLAmount + (Float(beginningBilLAmount) * (Float(PercentTip!) / 100   ))) / NumberOfPeople!)
        
        // Calcualte Total Tip Amount
        txtTotalTipAmount.text = "$" + String(format: "%.2f", (Float(beginningBilLAmount) * (Float(PercentTip!) / 100   )))
        
        
        // Calculate Total
        txtTotalAmountWithTip.text = "$" + String(format: "%.2f", beginningBilLAmount + (Float(beginningBilLAmount) * (Float(PercentTip!) / 100   )))
        
      
      
        
        
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        txtStartBillAmt!.text = "$0.00"
        txtPerPersonAmount!.text = "-"
        txtTotalTipAmount.text = "-"
        txtTotalAmountWithTip.text = "-"
        beginningBilLAmount = 0.0
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.canDisplayBannerAds = true
        
       // border.layer.borderColor =   UIColor.green.cgColor
      //  border.layer.borderWidth = 3.0

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Perc_Action(_ sender: Any) {
        txtPercentTip.text = "15"
        CalculateTotals()
        dismissKeyboard()
    }
    
    @IBAction func Perc18_Action(_ sender: Any) {
        txtPercentTip.text = "18"
        CalculateTotals()
        dismissKeyboard()
    }
    
    @IBAction func Perc20_Action(_ sender: Any) {
        txtPercentTip.text = "20"
        CalculateTotals()
        dismissKeyboard()
    }
    
    
    
}

