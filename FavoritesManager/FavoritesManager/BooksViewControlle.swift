import UIKit

class BooksViewController: FavoritesListViewController {
    
    override func viewDidLoad() {
        items = FavoriteData.books
        title = "Books"
        super.viewDidLoad()
    }
}
