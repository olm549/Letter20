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
        animate()
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
    func animate(){
        ClasesBtn.frame.origin.x += view.bounds.width
        imagenClases.frame.origin.x += view.bounds.width
        EstadisticasBtn.frame.origin.x += view.bounds.width
        imagenStats.frame.origin.x += view.bounds.width
        SalirBtn.frame.origin.x += view.bounds.width
        imagenLogout.frame.origin.x += view.bounds.width
        UIView.animate(withDuration: 0.2,
                       delay: 0.2,
                       options: [],
                       animations: {
                        self.ClasesBtn.frame.origin.x -= self.view.bounds.width
                        self.imagenClases.frame.origin.x -= self.view.bounds.width
                        
        },
                       completion: nil)
        UIView.animate(withDuration: 0.2,
                       delay: 0.4,
                       options: [],
                       animations: {
                        self.EstadisticasBtn.frame.origin.x -= self.view.bounds.width
                        self.imagenStats.frame.origin.x -= self.view.bounds.width
                        
        },
                       completion: nil)
        UIView.animate(withDuration: 0.2,
                       delay: 0.6,
                       options: [],
                       animations: {
                        self.SalirBtn.frame.origin.x -= self.view.bounds.width
                        self.imagenLogout.frame.origin.x -= self.view.bounds.width
                        
        },
                       completion: nil)
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
