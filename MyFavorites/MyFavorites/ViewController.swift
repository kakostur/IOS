

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "🎬 Favorite Movies"
        case 1: return "🎵 Favorite Music"
        case 2: return "📚 Favorite Books"
        case 3: return "🎓 Favorite University Courses"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell

        var item: FavoriteItem
        switch indexPath.section {
        case 0: item = movies[indexPath.row]
        case 1: item = music[indexPath.row]
        case 2: item = books[indexPath.row]
        case 3: item = courses[indexPath.row]
        default: fatalError()
        }
        
        cell.configure(with: item)
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    let movies = [
        FavoriteItem(
            title: "Avengers: Endgame",
            subtitle: "Russo Brothers, 2019",
            review: "Epic conclusion to the Infinity Saga with perfect balance of action, emotion, and fan service. Every character gets their moment to shine.",
            image: UIImage(named: "avengers") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Haikyuu!! Movie",
            subtitle: "Susumu Mitsunaka, 2024",
            review: "Inspiring sports anime that captures the passion and determination of volleyball. Beautiful animation and emotional storytelling.",
            image: UIImage(named: "haikyuu") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Avatar: The Last Airbender",
            subtitle: "M. Night Shyamalan, 2010",
            review: "Though the live-action had issues, the original animated series remains a masterpiece of storytelling and world-building.",
            image: UIImage(named: "avatar") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "The Devil Wears Prada",
            subtitle: "David Frankel, 2006",
            review: "Meryl Streep delivers an iconic performance in this witty film about fashion, ambition, and finding yourself.",
            image: UIImage(named: "devilWearsPrada") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Pirates of the Caribbean",
            subtitle: "Gore Verbinski, 2007",
            review: "Johnny Depp's Captain Jack Sparrow is unforgettable. Perfect blend of adventure, humor, and swashbuckling action.",
            image: UIImage(named: "pirates") ?? UIImage(systemName: "photo")!
        )
    ]

    let music = [
        FavoriteItem(
            title: "Woke Up",
            subtitle: "XG, 2025",
            review: "Woke Up is a 2024 single by Japanese girl group XG. Catchy and energetic.",
            image: UIImage(named: "wokeUp") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Aiyptama",
            subtitle: "Ninety One, 2015",
            review: "Debut mini-album by Kazakh Q-pop group Ninety One.",
            image: UIImage(named: "aiyptama") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "One of your girls",
            subtitle: "The Weeknd, JENNIE, Lily-Rose Depp, 2023",
            review: "Hit song featured on HBO series The Idol soundtrack.",
            image: UIImage(named: "oneOfYourGirls") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Can't Hold Us",
            subtitle: "Macklemore & Ryan Lewis, 2011",
            review: "High-energy song with optimistic 'us against the world' vibe.",
            image: UIImage(named: "cantHoldUs") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Altynym",
            subtitle: "Aikyn Tolepbergen, 2013",
            review: "Popular Kazakh song about first love.",
            image: UIImage(named: "altynym") ?? UIImage(systemName: "photo")!
        )
    ]

    let books = [
        FavoriteItem(
            title: "Little Women",
            subtitle: "Louisa May Alcott, 1868",
            review: "Timeless story of sisterhood, family, and growing up.",
            image: UIImage(named: "littleWomen") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "And Then There Were None",
            subtitle: "Agatha Christie, 1939",
            review: "Renowned mystery novel about ten strangers with guilty secrets.",
            image: UIImage(named: "agatha") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "The Secret Garden",
            subtitle: "Frances Hodgson Burnett, 1911",
            review: "Beautiful tale of healing and transformation through nature.",
            image: UIImage(named: "theSecretGarden") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Flowers for Algernon",
            subtitle: "Daniel Keyes, 1966",
            review: "Heartbreaking story about intelligence, humanity, and growth.",
            image: UIImage(named: "flowersForAlgernon") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Me Before You",
            subtitle: "Jojo Moyes, 2012",
            review: "Emotional story about love and life choices.",
            image: UIImage(named: "meBeforeYou") ?? UIImage(systemName: "photo")!
        )
    ]

    let courses = [
        FavoriteItem(
            title: "iOS Development",
            subtitle: "KBTU, 2025",
            review: "Learned UIKit, Auto Layout, and built working apps.",
            image: UIImage(named: "iosDev") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Calculus",
            subtitle: "KBTU, 2023",
            review: "Challenging but rewarding course in mathematics.",
            image: UIImage(named: "calculus") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Linear Algebra",
            subtitle: "KBTU, 2024",
            review: "Vectors, matrices, and transformations explained clearly.",
            image: UIImage(named: "linearAlgebra") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Algorithms and Data Structures",
            subtitle: "KBTU, 2025",
            review: "Fundamental course teaching efficient coding and problem-solving.",
            image: UIImage(named: "algorithms") ?? UIImage(systemName: "photo")!
        ),
        FavoriteItem(
            title: "Web Development",
            subtitle: "KBTU, 2025",
            review: "Introduction to HTML, CSS, JS, and modern frameworks.",
            image: UIImage(named: "WebDev") ?? UIImage(systemName: "photo")!
        )
    ]

}

