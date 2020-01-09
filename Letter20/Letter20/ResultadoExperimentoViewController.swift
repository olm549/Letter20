//
//  ResultadoExperimentoViewController.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class ResultadoExperimentoViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        animate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        letraEsperada.layer.borderColor = UIColor.black.cgColor
        letraEsperada.layer.borderWidth = 4
        letraReconocida.layer.borderColor = UIColor.black.cgColor
        letraReconocida.layer.borderWidth = 4
        letraEsperada.text = String(letter)
        letraReconocida.text = String(guessedLetter)
        resultado = false
    }
    //MARK : Atributos
    var letter : Character!
    var guessedLetter : Character!
    var student : NSManagedObject!
    var resultado : Bool!
    @IBOutlet weak var letraEsperada: UILabel!
    @IBOutlet weak var letraReconocida: UILabel!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       registrarExperimento()
    }

    func registrarExperimento(){
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy  HH:mm"
        let dateString = dateFormatter.string(from: date as Date)
        if(letraEsperada.text == letraReconocida.text){
            resultado = true
        }
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Experimento", in: managedContext)!
        let experimento = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        experimento.setValue(dateString, forKey: "fechaExperimento")
        experimento.setValue(String(letter), forKey: "letraExperimento")
        experimento.setValue(resultado, forKey: "resultadoExperimento")
        experimento.setValue(student, forKey: "alumnoExperimento")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func animate(){
        letraEsperada.frame.origin.x += self.view.bounds.width
        letraReconocida.frame.origin.x += self.view.bounds.width
        UIView.animate(withDuration: 0.3,
                       delay: 0.3,
                       options: [],
                       animations: {
                        self.letraEsperada.frame.origin.x -= self.view.bounds.width
                        
            },
                       completion: nil)
        UIView.animate(withDuration: 0.3,
                       delay: 0.6,
                       options: [],
                       animations: {
                        self.letraReconocida.frame.origin.x -= self.view.bounds.width
                        
            },
                       completion: nil)
    }
}
