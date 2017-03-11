//
//  ViewController.swift
//  TipCalculator
//
//  Created by ZhuodiLiu on 3/10/17.
//  Copyright © 2017 ZhuodiLiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var percentSelect: UISegmentedControl!
    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var companions: UILabel!
    @IBOutlet weak var addCompanionOp: UIStepper!
    @IBOutlet weak var averageBill: UILabel!
    var numberOfCompanions = 1.0
    var sum = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapOnScreen(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func addCompanions(sender: UIStepper) {
        let add = addCompanionOp.value
        numberOfCompanions = add
        let average = sum / numberOfCompanions
        companions.text = String(Int(numberOfCompanions))
        averageBill.text = String(format: "$%.2f", average)
    }
    
    
    @IBAction func calculateTip(sender: AnyObject) {
        let value = Double(inputValue.text!) ?? 0.0
        let tipPercent = [0.15, 0.18, 0.20]
        let tip = value * tipPercent[percentSelect.selectedSegmentIndex]
        sum = value + tip
        tipValue.text = String(format: "$%.2f", tip)
        totalValue.text = String(format: "$%.2f", sum)
        let average = sum / numberOfCompanions
        companions.text = String(Int(numberOfCompanions))
        averageBill.text = String(format: "$%.2f", average)
    }
}

