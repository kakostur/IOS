import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            itemImageView.contentMode = .scaleAspectFit
            itemImageView.layer.cornerRadius = 8
            itemImageView.clipsToBounds = true
            
            titleLabel.textColor = .label
            subtitleLabel.textColor = .secondaryLabel
            reviewLabel.textColor = .gray
            reviewLabel.numberOfLines = 0
        }

        func configure(with item: FavoriteItem) {
            titleLabel.text = item.title
            subtitleLabel.text = item.subtitle
            reviewLabel.text = item.review
            itemImageView.image = item.image
        }
    
}
