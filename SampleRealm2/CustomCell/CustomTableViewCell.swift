//
//  CustomTableViewCell.swift
//  SampleRealm2
//
//  Created by 原田摩利奈 on 2019/01/23.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setImage(imageData: UIImage) {
        pictureImageView.image = imageData
    }
    
    func setDate(dateData: String) {
        dateLabel.text = dateData
    }
    
    func setContents(contentsData: String) {
        contentsLabel.text = contentsData
    }
}
