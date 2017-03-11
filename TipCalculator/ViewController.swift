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

    @IBAction func calculateTip(sender: AnyObject) {
        let value = Double(inputValue.text!) ?? 0.0
        let tipPercent = [0.15, 0.18, 0.20]
        let tip = value * tipPercent[percentSelect.selectedSegmentIndex]
        let sum = value + tip
        tipValue.text = String(format: "$%.2f", tip)
        totalValue.text = String(format: "$%.2f", sum)
    }
}

