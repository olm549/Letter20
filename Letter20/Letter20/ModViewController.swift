//
//  ModViewController.swift
//  Letter20
//
//  Created by Aula11 on 17/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData


class ModViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        // Do any additional setup after loading the view.
    }
    
    var clase : NSManagedObject!
    var student : NSManagedObject!
    
    @IBAction func modStudent(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rmStudent(_ sender: UIButton) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alumno")
        fetchRequest.predicate = NSPredicate(format: "claseAlumno == %@", (clase))
        do{
            let test = try managedContext.fetch(fetchRequest)
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }catch{
            print(error)
        }
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
    
}
