import UIKit

class FavoritesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet var tableView: UITableView!
    
    var items: [FavoriteItem] = []
    
    let cellIdentifier = "FavoriteCell"
    let segueIdentifier = "showDetailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
      
        tableView.rowHeight = 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoriteCell else {
            fatalError("Could not dequeue FavoriteCell")
        }
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: segueIdentifier, sender: items[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            guard let detailVC = segue.destination as? DetailViewController,
                  let selectedItem = sender as? FavoriteItem else {
                return
            }
            detailVC.item = selectedItem
        }
    }
}
