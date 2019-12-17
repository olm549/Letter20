//
//  ViewController.swift
//  Letter20
//
//  Created by Aula11 on 3/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var signIcon: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    
    @IBAction func signIconAction(_ sender: UITapGestureRecognizer) {
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        modalViewController.signText.text = "Toca el sensor, introduce la huella"
    }
    @IBAction func login(_ sender: UIButton) {

        if(userNameField.text == "Paco"){
            performSegue(withIdentifier: "loginIsRight", sender: UIButton())
        }else{
            let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
            modalViewController.modalPresentationStyle = .overCurrentContext
            present(modalViewController, animated: true, completion: nil)
            modalViewController.signText.text = "Datos incorrectos"
        }
        
    }
}


