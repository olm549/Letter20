//
//  ViewController.swift
//  Letter20
//
//  Created by Aula11 on 3/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData

class StudentViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var guardarBtn: UIBarButtonItem!
    var student : NSManagedObject!
    var clase : NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        ageTF.delegate = self
        imageView.makeRounded()
        if student == nil{
            guardarBtn.isEnabled = false
        }else{
            guardarBtn.isEnabled = true
            nameTF.text = student.value(forKey: "nombreAlumno") as? String
            //imageView.image = student?.imageS
            //ageTF.text = student?.ageS
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        nameTF.resignFirstResponder()
        ageTF.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTF.text!.isEmpty || nameTF.text == ""{
        }else{
            if  ageTF.text!.isEmpty || ageTF.text == ""{}else{
                guardarBtn.isEnabled = true
            }
        }
    }
    
    
    
    
    @IBAction func cancelarBtn(_ sender: UIBarButtonItem) {
         navigationController!.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        aniadirAlumno()
    }
    
    @IBAction func addImage(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    func aniadirAlumno(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Alumno", in: managedContext)!
        let alumno = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        alumno.setValue(nameTF.text, forKey: "nombreAlumno")
        alumno.setValue(Int(ageTF.text!), forKey: "edadAlumno")
        alumno.setValue(imageView.image?.pngData(), forKey: "fotoAlumno")
        alumno.setValue(clase, forKey: "claseAlumno")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
}


extension UIImageView {
    
    func makeRounded() {
        
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
