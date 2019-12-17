//
//  AniadirClaseViewController.swift
//  Letter20
//
//  Created by Aula11 on 17/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class AniadirClaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = UIColor(white: 0, alpha: 0.5)

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var guardarButton: UIButton!
    
    @IBAction func cancelar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
