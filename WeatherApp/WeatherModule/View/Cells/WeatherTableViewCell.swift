//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Zibra Coders on 15/12/2020.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.text = ""
        tempMinLabel.text = ""
        tempMaxLabel.text = ""
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with object: WeatherCell) {
        dateLabel.text = object.date
        tempMinLabel.text = object.min
        tempMaxLabel.text = object.max
        switch object.icon {
        case "Clouds":
            icon.image = UIImage(systemName: "cloud.fill")
        case "Rain":
            icon.image = UIImage(systemName: "cloud.rain.fill")
        case "Thunderstorm":
            icon.image = UIImage(systemName: "cloud.bolt.fill")
        case "Clear":
            icon.image = UIImage(systemName: "sun.max.fill")
        default:
            icon.image = UIImage(systemName: "cloud.sun.fill")
        }
    }
    
}
struct WeatherCell {
    let icon: String
    let min: String
    let max: String
    let date: String
}
