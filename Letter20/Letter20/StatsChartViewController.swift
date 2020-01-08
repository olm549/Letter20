//
//  StatsChartViewController.swift
//  Letter20
//
//  Created by Aula11 on 8/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import Charts
import CoreData

class StatsChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        titulos.append("Aciertos")
        titulos.append("Fallos")
        cargarDatos()
        setChart(dataPoints: titulos, values: valores)
    }
    @IBOutlet weak var pieChartView: PieChartView!
    var titulos = [String]()
    var valores = [Int]()
    var resultados = [NSManagedObject]()
    var alumno: NSManagedObject!
    var letter : Character!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func cargarDatos(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        if(letter != nil){
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Experimento")
            fetchRequest.predicate = NSPredicate(format: "letraExperimento == %@", String(letter))
            do {
                resultados = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
            
        }else{
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Alumno")
            fetchRequest.predicate = NSPredicate(format: "Alumno == %@", alumno)
            do {
                resultados = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        filtrarDatos()
    }
    func filtrarDatos(){
        
        if(letter != nil){
            var contador : Int = 0
            let temp = resultados as! [Experimento]
            for experimento in temp {
                if(experimento.resultadoExperimento == true){
                    contador = contador + 1
                }
            }
            valores.append(contador)
            valores.append(temp.count-contador)
        }
    }
    func setChart(dataPoints: [String], values: [Int]) {
        pieChartView.noDataText = "No hay datos"
        
    }
}
