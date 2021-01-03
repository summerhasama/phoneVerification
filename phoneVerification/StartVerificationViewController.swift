//
//  ViewController.swift
//  phoneVerification
//
//  Created by Summer Hasama on 1/2/21.
//

import UIKit

class StartVerificationViewController: UIViewController {

    static let path = Bundle.main.path(forResource: "Config", ofType: "plist")
    static let config = NSDictionary(contentsOfFile: path!)
    private static let baseURLString = config!["serverUrl"] as! String

   
    @IBOutlet weak var countryCodeField: UITextField!
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    

    @IBAction func sendVerification(_ sender: Any) {
        if let phoneNumber = phoneNumberField.text,
            let countryCode = countryCodeField.text {
            VerifyAPI.sendVerificationCode(countryCode, phoneNumber)
                }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let dest = segue.destination as? CheckVerificationViewController {
               dest.countryCode = countryCodeField.text
               dest.phoneNumber = phoneNumberField.text
           }
       }
   }
