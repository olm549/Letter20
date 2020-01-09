//
//  StatsViewController.swift
//  Letter20
//
//  Created by Aula11 on 8/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        animate()
    }
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()
        alumnosButton.layer.fixIconSize()
        imgAlumnos.layer.fixIconSize()
        imgAlumnos.clipsToBounds = true
        letrasButton.layer.fixIconSize()
        imgLetras.layer.fixIconSize()
        imgLetras.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imgLetras: UIImageView!
    @IBOutlet weak var imgAlumnos: UIImageView!
    @IBOutlet weak var alumnosButton: UIButton!
    @IBOutlet weak var letrasButton: UIButton!
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
    func animate(){
        imgAlumnos.frame.origin.x += view.bounds.width
        imgLetras.frame.origin.x += view.bounds.width
        alumnosButton.frame.origin.x += view.bounds.width
        letrasButton.frame.origin.x += view.bounds.width
        UIView.animate(withDuration: 0.2,
                       delay: 0.2,
                       options: [],
                       animations: {
                        self.imgAlumnos.frame.origin.x -= self.view.bounds.width
                        self.alumnosButton.frame.origin.x -= self.view.bounds.width
                        
        },
                       completion: nil)
        UIView.animate(withDuration: 0.2,
                       delay: 0.4,
                       options: [],
                       animations: {
                        self.imgLetras.frame.origin.x -= self.view.bounds.width
                        self.letrasButton.frame.origin.x -= self.view.bounds.width
                        
        },
                       completion: nil)
    }
}
