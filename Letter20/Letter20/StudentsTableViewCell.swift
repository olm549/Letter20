//
//  StudentsTableViewCell.swift
//  Letter20
//
//  Created by Aula11 on 10/12/19.
//  Copyright © 2019 ual. All rights reserved.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageS: UIImageView!
    @IBOutlet weak var nameS: UILabel!
    @IBOutlet weak var ageS: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
