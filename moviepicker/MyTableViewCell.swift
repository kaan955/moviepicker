//
//  MyTableViewCell.swift
//  moviepicker
//
//  Created by Kaan Baysal on 22.11.2020.
//

import UIKit

class MyTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var progressStart: UISlider!
    @IBOutlet weak var progressEnd: UISlider!
  
    @IBOutlet weak var movieTuruL: UILabel!
    @IBOutlet weak var movieTuruResult: UILabel!
    @IBOutlet weak var izleyiciKitlesi: UILabel!
    @IBOutlet weak var izleyiciKitlesiResult: UILabel!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


