//
//  Student.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class Student{
    
    //MARK: Atributos
    var nameS: String
    var imageS: UIImage?
    var ageS: String

    //MARK: Inicialización
    init?(nameS: String, imageS: UIImage?, ageS: String){
        self.nameS = nameS
        self.imageS = imageS
        self.ageS = ageS
    }
}
