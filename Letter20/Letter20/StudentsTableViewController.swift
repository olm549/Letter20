//
//  StudentsTableViewController.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit
import CoreData



class StudentsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarAlumnos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    var students = [NSManagedObject]()
    var profesor : NSManagedObject!
    var clase : NSManagedObject!
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell", for: indexPath) as! StudentsTableViewCell
        cell.nameS.text = students[indexPath.row].value(forKey: "nombreAlumno") as? String
        cell.ageS.text = String(students[indexPath.row].value(forKey: "edadAlumno") as! Int)
        if let imageData = students[indexPath.row].value(forKey: "fotoAlumno") as? Data{
            let image = UIImage(data : imageData)
            cell.imageS.image = image
            cell.imageS.makeRounded()
        }
        return cell
    }
    
    
    @IBAction func addNewStudent (sender: UIStoryboardSegue){
        cargarAlumnos()
        tableView.reloadData()
    }
    
    
   /* @IBAction func updateTable(sender: UIStoryboardSegue){
     let student : Student = (sender.source as! StudentViewController).student!
     let filaSeleccionada = tableView.indexPathForSelectedRow
     if filaSeleccionada == nil{
     addNewStudent(student: student)
     }else{
     updateStudent(student: student, idFila: filaSeleccionada!)
     }
     }
     func addNewStudent(student: Student){
     students.append(student)
     let newIndexPath: IndexPath = IndexPath(row: students.count-1, section: 0)
     tableView.insertRows(at: [newIndexPath], with: .bottom)
     }
     
     func updateStudent(student: Student, idFila: IndexPath){
     students[idFila.row] = student
     tableView.reloadRows(at: [idFila], with: .fade)
     }
    
    */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "addStudent" {
            let viewDestiny = segue.destination as! StudentViewController
            viewDestiny.clase = clase
        }
        if segue.identifier == "verLetras" {
            let segueDestino = segue.destination as! LetrasTableViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                //segueDestino.profesorClase = [profesor : self.classes[selectedRow]
                segueDestino.student = self.students[selectedRow]
            }
        }
     }
    func cargarAlumnos(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Alumno")
        fetchRequest.predicate = NSPredicate(format: "claseAlumno == %@", ((clase)))
        
        
        //3
        do {
            students = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
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
                let objectToDelete = test[indexPath.row] as! NSManagedObject
                managedContext.delete(objectToDelete)
                students.remove(at: indexPath.row)
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
    
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    override func tableView (_ tableView: UITableView,
                             titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) ->
        String? { return "Eliminar" }
    
    
    
    
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
