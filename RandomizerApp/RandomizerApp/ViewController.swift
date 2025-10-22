//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Karakat Tursynbaeva on 22.10.2025.
//

import UIKit

struct FavoriteItem {
    let title: String
    let imageName: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    let items = [
        FavoriteItem(title: "Yelena Belova", imageName: "yelena"),
        FavoriteItem(title: "Quicksilver", imageName: "quicksilver"),
        FavoriteItem(title: "Agatha", imageName: "agatha"),
        FavoriteItem(title: "Capitan Marvel", imageName: "captainMarvel"),
        FavoriteItem(title: "Doctor Steven Strange", imageName: "drStrange"),
        FavoriteItem(title: "Black Widow", imageName: "blackWidow"),
        FavoriteItem(title: "Scarlet Witch", imageName: "scarletWitch"),
        FavoriteItem(title: "Thor Odinson", imageName: "thor"),
        FavoriteItem(title: "Loki Odinson", imageName: "loki"),
        FavoriteItem(title: "Ironman", imageName: "ironMan")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        itemImageView.contentMode = .scaleAspectFit
        showRandomItem()
    }
    
    
    @IBAction func randomizeTapped(_ sender: Any) {
        showRandomItem()
    }
    
    func showRandomItem(){
        let randomItem = items.randomElement()!
        itemImageView.image = UIImage(named: randomItem.imageName)
        itemLabel.text = randomItem.title
    }

}

