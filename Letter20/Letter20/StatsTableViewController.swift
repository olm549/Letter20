//
//  StatsTableViewController.swift
//  Letter20
//
//  Created by Aula11 on 8/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class StatsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarResultados()
    }
    var resultados = [NSManagedObject]()
    var tipo : String!
    var letters = [Character]()
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tipo == "alumnos"){
            return 77.0
        }
        else{
            return 55.0
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tipo == "letras"){
            return letters.count
        }else{
            return resultados.count
        }
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tipo == "alumnos"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell", for: indexPath) as! StudentsTableViewCell
            cell.nameS.text = resultados[indexPath.row].value(forKey: "nombreAlumno") as? String
            cell.ageS.text = String(resultados[indexPath.row].value(forKey: "edadAlumno") as! Int)
            if let imageData = resultados[indexPath.row].value(forKey: "fotoAlumno") as? Data{
                let image = UIImage(data : imageData)
                cell.imageS.image = image
                cell.imageS.makeRounded()
                return cell
            }
        }
        if(tipo == "letras"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LetraTableViewCell", for: indexPath) as! LetraTableViewCell
            cell.labelLetra.text = "Letra \(String(letters[indexPath.row]))"
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell", for: indexPath)
            return cell
        }
     }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let segueDestino = segue.destination as! StatsChartViewController
            if(segue.identifier == "isAStudent"){
                segueDestino.alumno = resultados[selectedRow]
            }
            if(segue.identifier == "isALetter"){
                segueDestino.letter = self.letters[selectedRow]
                
            }
        }
     }
    
    func cargarResultados(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        if(tipo == "alumnos"){
           
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Alumno")
            do {
                resultados = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        
        }
        if(tipo == "letras"){
            let letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            for char in letras{
                letters.append(char)
            }
        }
        
    }
    
}
