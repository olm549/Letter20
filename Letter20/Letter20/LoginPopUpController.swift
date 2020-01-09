//
//  HuellaViewController.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        signAlert.layer.fixIconSize()
        signAlert.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor.black.cgColor
            cancelButton.layer.borderWidth = 2
        signText.layer.borderColor = UIColor.black.cgColor
        signText.layer.borderWidth = 2
        view?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
}

    @IBOutlet weak var signText: UILabel!
    @IBOutlet weak var signAlert: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signCancelButton(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
    }
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        //Login
                    } else {
                      self.signText.text = "Huella errónea,\nintroduce la huella"
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}
