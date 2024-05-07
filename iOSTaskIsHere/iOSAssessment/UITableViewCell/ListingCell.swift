//
//  ListingCell.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import UIKit

class ListingCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(obj : ListEntity) {
        lblTitle.text = obj.name
        lblDetail.text = obj.country
    }
}
