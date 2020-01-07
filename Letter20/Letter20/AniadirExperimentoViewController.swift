//
//  AniadirExperimentoViewController.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class AniadirExperimentoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.isHidden = true
        picker.layer.borderColor = UIColor.black.cgColor
        picker.layer.borderWidth = 2
        picker.layer.backgroundColor = UIColor.orange.withAlphaComponent(0.4).cgColor
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
            y2barText.becomeFirstResponder()
            x2barText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        case 1:
            self.y2barText.text = pickerData[row]
            x2ybrText.becomeFirstResponder()
            y2barText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 2:
            self.x2ybrText.text = pickerData[row]
            xy2brText.becomeFirstResponder()
            x2ybrText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 3:
            self.xy2brText.text = pickerData[row]
            xegeText.becomeFirstResponder()
            xy2brText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 4:
            self.xegeText.text = pickerData[row]
            yegeText.becomeFirstResponder()
            xegeText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 5:
            self.yegeText.text = pickerData[row]
            xegvyText.becomeFirstResponder()
            yegeText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 6:
            self.xegvyText.text = pickerData[row]
            yegvxText.becomeFirstResponder()
            xegvyText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 7:
            self.yegvxText.text = pickerData[row]
            xybarText.becomeFirstResponder()
            yegvxText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)

        case 8:
            self.xybarText.text = pickerData[row]
            xybarText.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
            picker.isHidden = true

        case .none:
            self.x2barText.text = pickerData[row]
        case .some(_):
            self.x2barText.text = pickerData[row]
        }
        
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
    
    @IBAction func sendTag(_ sender: UITextField) {
        picker.isHidden = false
        fieldValue = sender.tag
    }
}
