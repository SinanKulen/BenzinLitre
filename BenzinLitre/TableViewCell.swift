//
//  Cell.swift
//  BenzinLitre
//
//  Created by Sinan Kulen on 26.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
}
