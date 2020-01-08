//
//  LogoutController.swift
//  Letter20
//
//  Created by Aula11 on 17/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class LogoutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        signAlert.isOpaque = false
        signAlert.layer.masksToBounds = false
        signAlert.layer.borderWidth = 2
        signAlert.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderWidth = 2
        salirButton.layer.borderColor = UIColor.black.cgColor
        salirButton.layer.borderWidth = 2
        signText.layer.borderColor = UIColor.black.cgColor
        signText.layer.borderWidth = 2
        signText.layer.cornerRadius = signText.frame.height / 4
        view?.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var salirButton: UIButton!
    @IBOutlet weak var signAlert: UIView!
    @IBOutlet weak var signText: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logoutCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
