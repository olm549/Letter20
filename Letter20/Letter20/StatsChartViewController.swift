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
        inicializarArrays()
        cargarDatos()
        setChart(values: valores)
        
    }
    @IBOutlet weak var pieChartView: PieChartView!
    var valores = [Int]()
    var resultados = [NSManagedObject]()
    var alumno: NSManagedObject!
    var letter : Character!
    @IBOutlet weak var nombreAlumno: UILabel!
    @IBOutlet weak var edadAlumno: UILabel!
    @IBOutlet weak var experimentosAlumno: UILabel!
    @IBOutlet weak var avanceAlumno: UILabel!
    @IBOutlet weak var imagenAlumno: UIImageView!
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var edadLabel: UILabel!
    
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
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Experimento")
            fetchRequest.predicate = NSPredicate(format: "alumnoExperimento == %@", alumno)
            do {
                resultados = try managedContext.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        filtrarDatos()
        cargarInterfaz()
    }
    func filtrarDatos(){
            var contador : Int = 0
            let temp = resultados as! [Experimento]
            for experimento in temp {
                if(experimento.resultadoExperimento == true){
                    contador = contador + 1
                }
            }
            valores[0] = contador
            valores[1] = temp.count-contador
    }
    func setChart(values: [Int]) {
        pieChartView.noDataText = "No hay datos"
        pieChartView.chartDescription.text = "Porcentaje de aciertos"
        pieChartView.chartDescription.font = UIFont(name:"futura",size:12)!
        pieChartView.holeColor = UIColor.clear
        pieChartView.legend.drawInside = true
        let entry1 = PieChartDataEntry(value:Double(valores[0]), label:"Aciertos")
        let entry2 = PieChartDataEntry(value: Double(valores[1]), label:"Fallos")
        let pieChartDataSet=PieChartDataSet(values:[entry1,entry2],label:"")
        //pieChartDataSet.colors = ChartColorTemplates.pastel()
        pieChartDataSet.colors = [UIColor(cgColor:#colorLiteral(red: 0.360766773, green: 0.7639593909, blue: 0.4255178932, alpha: 1)) , UIColor(cgColor: #colorLiteral(red: 0.9850491751, green: 0.33067684, blue: 0.2709089689, alpha: 1))]
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
    }
    func inicializarArrays(){
        valores.append(0)
        valores.append(0)
    }
    func cargarInterfaz(){
        if(letter == nil){
            nombreAlumno.text = alumno.value(forKey: "nombreAlumno") as? String
            edadAlumno.text = String(alumno.value(forKey: "edadAlumno") as! Int)
            if let imageData = alumno.value(forKey: "fotoAlumno") as? Data{
                let image = UIImage(data : imageData)
                imagenAlumno.image = image
                imagenAlumno.makeRounded()
            }
            experimentosAlumno.text = "El alumno ha realizado \(resultados.count) experimentos"
            if(valores[0]>valores[1]){
                avanceAlumno.text = "Su avance es positivo"
            }else{
                avanceAlumno.text = "Su avance es negativo"
            }
        }
        else{
            statsLabel.text = "Estadísticas de letra"
            nombreLabel.text = "Estadísticas para la Letra: '\(String(letter))'"
            edadLabel.text = "Se han realizado \(resultados.count) experimentos"
            if(valores[0]>valores[1]){
                experimentosAlumno.text = "El recuento es positivo"
            }else{
                experimentosAlumno.text = "El recuento es negativo"
            }
            nombreAlumno.isHidden = true
            edadAlumno.isHidden = true
            avanceAlumno.isHidden = true
            imagenAlumno.isHidden = true
        }
    }
}
