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
    var tipPercent = [0.15, 0.18, 0.20]
    @IBOutlet weak var amountText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var companionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPercents()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadPercents() {
        let defaults = NSUserDefaults.standardUserDefaults()
        tipPercent[0] = Double(defaults.integerForKey("lowPercent") ?? 15) / 100.0
        tipPercent[1] = Double(defaults.integerForKey("mediumPercent") ?? 18) / 100.0
        tipPercent[2] = Double(defaults.integerForKey("highPercent") ?? 20) / 100.0
        percentSelect.setTitle(String(format: "%d%%", defaults.integerForKey("lowPercent") ?? 15), forSegmentAtIndex: 0)
        percentSelect.setTitle(String(format: "%d%%", defaults.integerForKey("mediumPercent") ?? 18), forSegmentAtIndex: 1)
        percentSelect.setTitle(String(format: "%d%%", defaults.integerForKey("highPercent") ?? 20), forSegmentAtIndex: 2)
    }
    
    func reCalculate() {
        let value = Double(inputValue.text!) ?? 0.0
        let tip = value * tipPercent[percentSelect.selectedSegmentIndex]
        sum = value + tip
        tipValue.text = String(format: "$%.2f", tip)
        totalValue.text = String(format: "$%.2f", sum)
        let average = sum / numberOfCompanions
        companions.text = String(Int(numberOfCompanions))
        averageBill.text = String(format: "$%.2f", average)
    }
    
    func loadLanguage() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let languageChoose = defaults.integerForKey("language") ?? 0
        if languageChoose == 0 {
            amountText.text = "Amount"
            tipText.text = "Tip"
            totalText.text = "Total"
            companionText.text = "Companions"
        }
        else if languageChoose == 1 {
            amountText.text = "Cantidad"
            tipText.text = "Extremidad"
            totalText.text = "Importe"
            companionText.text = "Colega"
        }
        else {
            amountText.text = "金额"
            tipText.text = "小费"
            totalText.text = "总价"
            companionText.text = "同行者"
        }
    }
    
    @IBAction func tapOnScreen(sender: AnyObject) {
        view.endEditing(true)
        loadPercents()
        reCalculate()
        loadLanguage()
    }

    @IBAction func addCompanions(sender: UIStepper) {
        numberOfCompanions = addCompanionOp.value
        reCalculate()
        loadLanguage()
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        loadPercents()
        reCalculate()
        loadLanguage()
    }
}

