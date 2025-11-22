import UIKit

class DetailViewController: UIViewController {

    var item: FavoriteItem?

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let item = item else { return }
        
        self.title = item.title

        itemImageView.image = item.image
        
        titleLabel.text = item.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        subtitleLabel.text = item.subtitle
        
        descriptionTextView.text = item.descriptionText
        descriptionTextView.font = UIFont.systemFont(ofSize: 17)
        descriptionTextView.isEditable = false
        
        let reviewHeader = "Review"
        reviewLabel.text = "\(reviewHeader)\n\(item.review)"
        reviewLabel.numberOfLines = 0
        reviewLabel.font = UIFont.systemFont(ofSize: 16)
        reviewLabel.textColor = .secondaryLabel
    }
}
