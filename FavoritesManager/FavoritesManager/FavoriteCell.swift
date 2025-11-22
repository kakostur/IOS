import UIKit

class FavoriteCell: UITableViewCell {
    
@IBOutlet weak var itemImageView: UIImageView!
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemImageView.layer.cornerRadius = 8
        itemImageView.clipsToBounds = true
        itemImageView.contentMode = .scaleAspectFill
    }
    
    func configure(with item: FavoriteItem) {
        itemImageView.image = item.image
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
}
