//
//  BotonLetra.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class BotonLetra: UIView {
    //MARK: Atributos
    var botones: [UIButton] = [UIButton]()
    // MARK: inicialización
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var boton: UIButton
        let cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for valor in cadena {
            boton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            boton.setTitle(String(valor), for: .normal)
            boton.backgroundColor = UIColor.blue
            addSubview(boton)
            botones += [boton]
        }
        
    }
    override func layoutSubviews() {
        for (i, boton) in botones.enumerated() {
            boton.frame.origin.x = CGFloat(i * (44 + 5))
        }
    }
    

}
