import UIKit

class MoviesViewController: FavoritesListViewController {
    
    override func viewDidLoad() {
        items = FavoriteData.movies
        title = "Movies"
        super.viewDidLoad() 
    }
}
