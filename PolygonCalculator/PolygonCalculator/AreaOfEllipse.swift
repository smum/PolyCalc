//
//  AreaOfEllipse.swift
//  PolygonCalculator
//
//  Created by Teens on 7/2/15.
//  Copyright (c) 2015 Teens. All rights reserved.
//

import UIKit

class AreaOfEllipse: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var semiminorField : UITextField!
    @IBOutlet var semimajorField : UITextField!
    @IBOutlet var calcButton : UIButton!
    @IBOutlet var resultLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        semiminorField.delegate = self
        semimajorField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            return true
        case ".":
            let array = Array(textField.text!.characters)
            var decimalCount = 0
            for character in array {
                if character == "." {
                    decimalCount++
                }
            }
            
            if decimalCount == 1 {
                return false
            } else {
                return true
            }
        default:
            let array = Array(string.characters)
            if array.count == 0 {
                return true
            }
            return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func calculate(_: AnyObject) {
        
        let semiminor = semiminorField.text!.floatValue
        let semimajor = semimajorField.text!.floatValue
        
        let result = semiminor * semimajor * 3.14
        
        resultLabel.text = String(stringInterpolationSegment: result)
        
    }
    
}
