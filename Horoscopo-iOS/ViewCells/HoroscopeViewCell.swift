//
//  HoroscopeViewCell.swift
//  Horoscopo-iOS
//
//  Created by Mañanas on 30/7/24.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(horoscope: Horoscope){
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        logoImageView.image = horoscope.logo
        
        favoriteImageView.isHidden = !(horoscope.id == UserDefaults.standard.string(forKey: "FAVORITE_HOROSCOPE") ?? "" )
    }

}
