//
//  CheckVerificationViewController.swift
//  phoneVerification
//
//  Created by Summer Hasama on 1/2/21.
//

import UIKit

class CheckVerificationViewController: UIViewController {


    
    @IBOutlet weak var codeField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        errorLabel.isHidden = true
    }
        
        var countryCode: String?
        var phoneNumber: String?
        
    
    
    @IBAction func validateCode(_ sender: Any) {
        self.errorLabel.text = nil // reset
        if let code = codeField.text {
            VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code) { checked in
                if (checked.success) {
                    self.errorLabel.text = checked.message
                    self.errorLabel.isHidden = false
                    self.errorLabel.textColor = UIColor.green
                    let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.timeToMoveOn), userInfo: nil, repeats: false)
                } else {
                    self.errorLabel.text = checked.message
                    self.errorLabel.isHidden = false
                    self.errorLabel.textColor = UIColor.red
                }
            }
        }
    }
    
        
    @objc func timeToMoveOn() {
            self.performSegue(withIdentifier: "successSegue", sender: self)
        }
    }
