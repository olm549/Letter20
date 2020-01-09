//
//  AniadirProfesorViewController.swift
//  Letter20
//
//  Created by Aula11 on 20/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData

class AniadirProfesorViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view?.backgroundColor = UIColor(white: 0, alpha: 0.5)
            signAlert.layer.fixIconSize()
            signAlert.layer.borderWidth = 2
            guardarButton.isEnabled = false
            guardarButton.alpha = 0.5;
            // Do any additional setup after loading the view.
        }
        
        @IBOutlet weak var signAlert: UIView!
        @IBOutlet weak var signText: UILabel!
        @IBOutlet weak var nombreTxt: UITextField!
        @IBOutlet weak var contraseniaTxt: UITextField!
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
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           aniadirProfesor()
        }
    //MARK : Método para añadir profesores
        func aniadirProfesor(){
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            let managedContext =
                appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Profesor", in: managedContext)!
            let profesor = NSManagedObject(entity: entity,
                                           insertInto: managedContext)
            profesor.setValue(nombreTxt.text, forKey: "usuario")
            profesor.setValue(contraseniaTxt.text, forKey: "contrasenia")
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    
    @IBAction func finCreacion(_ sender: UITextField) {
        if !nombreTxt.text!.isEmpty && !contraseniaTxt.text!.isEmpty{
            guardarButton.isEnabled = true
            guardarButton.alpha = 1;
        }
    }
        
}
