//
//  AniadirExperimentoViewController.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class AniadirExperimentoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.isHidden = true
        picker.isOpaque = true
        // Do any additional setup after loading the view.
    }
    // MARK: Atributos
    var pickerData : [String] = [String]()
    var student : NSManagedObject!
    var letter : Character!
    var fieldValue : Int!

    @IBOutlet weak var x2barText: UITextField!
    @IBOutlet weak var y2barText: UITextField!
    @IBOutlet weak var x2ybrText: UITextField!
    @IBOutlet weak var xy2brText: UITextField!
    @IBOutlet weak var xegeText: UITextField!
    @IBOutlet weak var yegeText: UITextField!
    @IBOutlet weak var xegvyText: UITextField!
    @IBOutlet weak var yegvxText: UITextField!
    @IBOutlet weak var xybarText: UITextField!
    @IBOutlet weak var letraAdivinada: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch fieldValue{
        case 0:
            self.x2barText.text = pickerData[row]
        case 1:
            self.y2barText.text = pickerData[row]
        case 2:
            self.x2ybrText.text = pickerData[row]
        case 3:
            self.xy2brText.text = pickerData[row]
        case 5:
            self.xegeText.text = pickerData[row]
        case 6:
            self.yegeText.text = pickerData[row]
        case 7:
            self.xegvyText.text = pickerData[row]
        case 8:
            self.yegvxText.text = pickerData[row]
        case 9:
            self.xybarText.text = pickerData[row]
        case .none:
            self.x2barText.text = pickerData[row]
        case .some(_):
            self.x2barText.text = pickerData[row]
        }
        
        picker.isHidden = true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueDestino = segue.destination as! ResultadoExperimentoViewController
        segueDestino.letter = letter
        segueDestino.student = student
        segueDestino.guessedLetter = Character(letraAdivinada.text!)
            //segueDestino.profesorClase = [profesor : self.classes[selectedRow]]

    }
    
    @IBAction func activarPicker(_ sender: UITextField) {
        picker.isHidden = false
        fieldValue = sender.tag
    }
}
