//
//  ViewController.swift
//  Letter20
//
//  Created by Aula11 on 3/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var student: Student?
    @IBOutlet weak var guardarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        ageTF.delegate = self
        imageView.makeRounded()
        if student == nil{
            guardarBtn.isEnabled = false
        }else{
            guardarBtn.isEnabled = true
            nameTF.text = student?.nameS
            imageView.image = student?.imageS
            ageTF.text = student?.ageS
        }
        // Do any additional setup after loading the view, typically from a nib.
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
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        student = Student(nameS: nameTF.text ?? "",
                      imageS: imageView.image,
                      ageS: ageTF.text ?? ""
                      )
  
    
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
    
    
}


extension UIImageView {
    
    func makeRounded() {
        
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
