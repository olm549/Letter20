//
//  ViewController.swift
//  Letter20
//
//  Created by Aula11 on 3/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData

class IndexViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var signIcon: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var usuario : NSManagedObject!
    var boolLogin = false
    
    @IBAction func signIconAction(_ sender: UITapGestureRecognizer) {
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        modalViewController.signText.text = "Toca el sensor, introduce la huella"
    }
    @IBAction func login(_ sender: UIButton) {
        fetchProfesores()
        if(boolLogin == false){
            let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
            modalViewController.modalPresentationStyle = .overCurrentContext
            present(modalViewController, animated: true, completion: nil)
            modalViewController.signText.text = "Datos incorrectos"
        }else{
            performSegue(withIdentifier: "loginIsRight", sender: UIButton())
        }
        
    }
    func fetchProfesores(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Profesor")
        fetchRequest.predicate = NSPredicate(format: "usuario == %@ AND contrasenia == %@", userNameField.text!,passwordField.text!)
      
        do {
            var fetch = try managedContext.fetch(fetchRequest)
            if(fetch.count == 0){
                boolLogin = false
                return;
            }else{
                boolLogin = true
                //3
                usuario = fetch[0]
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    //MARK: - Segue desde addProfesor
    @IBAction func addNewProfesor (sender: UIStoryboardSegue){
    }
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginIsRight"){
                let segueDestino = segue.destination as! MenuViewController
                segueDestino.profesor = usuario
            }
        }
    
}


