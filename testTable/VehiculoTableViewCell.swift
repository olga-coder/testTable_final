//
//  VehiculoTableViewCell.swift
//  testTable
//
//  Created by Mati on 14/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

class VehiculoTableViewCell: UITableViewCell {

  
  
  @IBOutlet weak var vehiculoTitleLabel: UILabel!
  @IBOutlet weak var vehiculoImageView: UIImageView!
  
  @IBOutlet weak var vehiculoTextLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
