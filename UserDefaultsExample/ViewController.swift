//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by Domo on 18/12/2019.
//  Copyright © 2019 Domo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var writeTextView: UITextView!
    @IBOutlet weak var writeSwitch: UISwitch!
    @IBOutlet weak var writeSlider: UISlider!
    
    @IBOutlet weak var readTextView: UITextView!
    @IBOutlet weak var readSwitch: UISwitch!
    @IBOutlet weak var readSlider: UISlider!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                
                self.view.frame.origin.y -= keyboardSize.height - 85
                
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        defaults.set(writeTextView.text, forKey: "writeTextViewValue")
        defaults.set(writeSwitch.isOn, forKey: "writeSwitchValue")
        defaults.set(writeSlider.value, forKey: "writeSliderValue")
    }
    
    @IBAction func readButtonTapped(_ sender: Any) {
        readTextView.text = defaults.string(forKey: "writeTextViewValue")
        readSwitch.isOn = defaults.bool(forKey: "writeSwitchValue")
        readSlider.value = defaults.float(forKey: "writeSliderValue")
    }
    
}
