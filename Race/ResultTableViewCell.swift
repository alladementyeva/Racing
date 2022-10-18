//
//  ResultTableViewCell.swift
//  Race
//
//  Created by user on 18.10.2022.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var timeResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
