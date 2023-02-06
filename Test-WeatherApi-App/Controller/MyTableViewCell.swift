//
//  MyTableViewCell.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 03.02.23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelTemp: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
