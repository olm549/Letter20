//
//  ExperimentosTableViewController.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class ExperimentosTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarExperimentos()
    }
    //MARK: Variables
    var experimentos = [NSManagedObject]()
    var letter : Character!
    var student: NSManagedObject!
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experimentos.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            let managedContext =
                appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Experimento")
            let predicateIsStudent = NSPredicate(format: "alumnoExperimento == %@", student)
            let predicateIsLetter = NSPredicate(format: "letraExperimento == %@", String(letter))
            fetchRequest.predicate = NSCompoundPredicate(type: .and, subpredicates: [predicateIsStudent, predicateIsLetter])
            do{
                let test = try managedContext.fetch(fetchRequest)
                let objectToDelete = test[indexPath.row] as! NSManagedObject
                managedContext.delete(objectToDelete)
                experimentos.remove(at: indexPath.row)
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }catch{
                print(error)
            }
            tableView.reloadData();
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExperimentosTableViewCell", for: indexPath) as! ExperimentosTableViewCell
        
        cell.fechaExperimentos.text = experimentos[indexPath.row].value(forKey: "fechaExperimento") as? String
        let tempResult = experimentos[indexPath.row].value(forKey: "resultadoExperimento") as? Bool
        if(tempResult == true){
            cell.imgExperimentos.image = #imageLiteral(resourceName: "Check verde")
        }else{
            cell.imgExperimentos.image = #imageLiteral(resourceName: "Cruz error")
        }
        return cell
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
        let segueDestino = segue.destination as! AniadirExperimentoViewController
            segueDestino.student = student
            segueDestino.letter = letter
        print(letter)
    }
    
    func cargarExperimentos(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Experimento")
        let predicateIsStudent = NSPredicate(format: "alumnoExperimento == %@", student)
        let predicateIsLetter = NSPredicate(format: "letraExperimento == %@", String(letter))
        fetchRequest.predicate = NSCompoundPredicate(type: .and, subpredicates: [predicateIsStudent, predicateIsLetter])
        
        //3
        do {
            experimentos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    @IBAction func addNewExperiment (sender: UIStoryboardSegue){
        cargarExperimentos()
        tableView.reloadData()
    }

}
