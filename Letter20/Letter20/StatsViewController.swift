//
//  StatsViewController.swift
//  Letter20
//
//  Created by Aula11 on 8/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestino = segue.destination as! StatsTableViewController
        if(segue.identifier == "statsLetras"){
            segueDestino.tipo = "letras"
        }
        if(segue.identifier == "statsAlumnos"){
            segueDestino.tipo = "alumnos"
        }
    }

}
