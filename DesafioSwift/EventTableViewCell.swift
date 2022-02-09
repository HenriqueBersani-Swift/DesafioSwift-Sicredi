//
//  EventTableViewCell.swift
//  DesafioSwift
//
//  Created by Henrique Bersani on 2/8/22.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var eventTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
