//
//  LetrasTableViewController.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class LetrasTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letras{
            letters.append(char)

        }
    }
    //MARK: Atributos
    var student : NSManagedObject!
    var letters = [Character]()
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetraTableViewCell", for: indexPath) as! LetraTableViewCell
        cell.labelLetra.text = "Letra \(String(letters[indexPath.row]))"
        return cell
    }
    override func tableView (_ tableView: UITableView,
                             titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) ->
        String? { return "Eliminar" }

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
        let segueDestino = segue.destination as! ExperimentosTableViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            //segueDestino.profesorClase = [profesor : self.classes[selectedRow]]
            segueDestino.student = student
            segueDestino.letter = self.letters[selectedRow]
        }
    }
 

}
