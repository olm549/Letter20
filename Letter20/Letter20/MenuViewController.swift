//
//  MenuViewController.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ClasesBtn.layer.borderColor = UIColor.black.cgColor
        ClasesBtn.layer.borderWidth = 4
        EstadisticasBtn.layer.borderColor = UIColor.black.cgColor
        EstadisticasBtn.layer.borderWidth = 4
        SalirBtn.layer.borderColor = UIColor.black.cgColor
        SalirBtn.layer.borderWidth = 4
        
        // Do any additional setup after loading the view.
    }
    
    //color amarillo FFF3D1
    //color fondo azul A9D0F4
    //color navigationbar 4165E7
    
    @IBOutlet weak var ClasesBtn: UIButton!
    @IBOutlet weak var EstadisticasBtn: UIButton!
    @IBOutlet weak var SalirBtn: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
