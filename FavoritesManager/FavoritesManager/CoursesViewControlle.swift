import UIKit

class CoursesViewController: FavoritesListViewController {
    
    override func viewDidLoad() {
        items = FavoriteData.courses
        title = "Courses "
        super.viewDidLoad()
    }
}
