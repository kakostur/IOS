import UIKit

class MusicViewController: FavoritesListViewController {
    
    override func viewDidLoad() {
        items = FavoriteData.music
        title = "Music"
        super.viewDidLoad()
    }
}
