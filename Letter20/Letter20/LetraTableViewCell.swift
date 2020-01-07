//
//  LetraTableViewCell.swift
//  Letter20
//
//  Created by Aula11 on 7/1/20.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class LetraTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var labelLetra: UILabel!
}
