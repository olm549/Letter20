//
//  MenuViewController.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ClasesBtn.layer.fixIconSize()
        imagenClases.layer.cornerRadius = imagenClases.frame.height / 4
        imagenClases.clipsToBounds = true
        EstadisticasBtn.layer.fixIconSize()
        imagenStats.layer.fixIconSize()
        imagenStats.clipsToBounds = true
        SalirBtn.layer.fixIconSize()
        imagenLogout.layer.fixIconSize()
        imagenLogout.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imagenLogout: UIImageView!
    @IBOutlet weak var imagenClases: UIImageView!
    @IBOutlet weak var imagenStats: UIImageView!
    @IBOutlet weak var ClasesBtn: UIButton!
    @IBOutlet weak var EstadisticasBtn: UIButton!
    @IBOutlet weak var SalirBtn: UIButton!
    var profesor : NSManagedObject!
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "classList"){
            let segueDestino = segue.destination as! ClassTableViewController
            segueDestino.profesor = profesor
        }
     }
    
   
}

extension CALayer {
   
    func fixIconSize(){
        self.masksToBounds = false
        self.borderWidth = 4
        self.borderColor = UIColor.black.cgColor
        self.cornerRadius = self.frame.height / 4
    }
    
}
