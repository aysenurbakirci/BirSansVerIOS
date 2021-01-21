//
//  DesignTableViewCell.swift
//  BirSansVerIOS
//
//  Created by Ayşe Nur Bakırcı on 8.01.2021.
//

import UIKit

class DesignTableViewCell: UITableViewCell {

    @IBOutlet weak var ilanKategoriBilgisi: UILabel!
    @IBOutlet weak var ilanHastaneBilgsi: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
