//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by ZhuodiLiu on 3/11/17.
//  Copyright © 2017 ZhuodiLiu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var lowPercent: UISlider!
    @IBOutlet weak var mediumPercent: UISlider!
    @IBOutlet weak var highPercent: UISlider!
    @IBOutlet weak var lowP: UILabel!
    @IBOutlet weak var mediumP: UILabel!
    @IBOutlet weak var highP: UILabel!
    @IBOutlet weak var languageChoose: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        lowPercent.value = Float(defaults.integerForKey("lowPercent") ?? 15) / 100
        mediumPercent.value = Float(defaults.integerForKey("mediumPercent") ?? 18) / 100
        highPercent.value = Float(defaults.integerForKey("highPercent") ?? 20) / 100
        lowP.text = String(format: "%d%%", defaults.integerForKey("lowPercent"))
        mediumP.text = String(format: "%d%%", defaults.integerForKey("mediumPercent"))
        highP.text = String(format: "%d%%", defaults.integerForKey("highPercent"))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func percentChanged(sender: AnyObject) {
        lowP.text = String(format: "%d%%", Int(lowPercent.value * 100))
        mediumP.text = String(format: "%d%%", Int(mediumPercent.value * 100))
        highP.text = String(format: "%d%%", Int(highPercent.value * 100))
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(Int(lowPercent.value * 100), forKey: "lowPercent")
        defaults.setInteger(Int(mediumPercent.value * 100), forKey: "mediumPercent")
        defaults.setInteger(Int(highPercent.value * 100), forKey: "highPercent")
        defaults.synchronize()
        
    }

    @IBAction func languageChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(languageChoose.selectedSegmentIndex, forKey: "language")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
