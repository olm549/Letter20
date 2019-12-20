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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var signIcon: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var usuariosFetch : [NSManagedObject] = []
    var boolLogin = false
    
    @IBAction func signIconAction(_ sender: UITapGestureRecognizer) {
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        modalViewController.signText.text = "Toca el sensor, introduce la huella"
    }
    @IBAction func login(_ sender: UIButton) {
        fetchProfesores()
        checkFetchCount()
        if(boolLogin == false){
            let modalViewController = storyboard?.instantiateViewController(withIdentifier: "LoginPopUpViewController") as! LoginPopUpViewController
            modalViewController.modalPresentationStyle = .overCurrentContext
            present(modalViewController, animated: true, completion: nil)
            modalViewController.signText.text = "Datos incorrectos"
        }else{
            performSegue(withIdentifier: "loginIsRight", sender: UIButton())
        }
        
    }
    func checkFetchCount(){
        if(usuariosFetch.count == 0){
            boolLogin = false
        }else{
            boolLogin = true
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
        
        
        //3
        do {
            usuariosFetch = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    @IBAction func addNewProfesor (sender: UIStoryboardSegue){
    }
}


