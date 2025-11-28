import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    
    // Properties
    private var currentSuperhero: Superhero?
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupContentViewBackground()

        setupUI()
        loadRandomSuperhero()
    }
    
    //  Setup
    private func setupUI() {
        print("Setting up UI")
        title = "Superhero Randomizer"
        
        // Image View
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        heroImageView.contentMode = .scaleAspectFit
        
        // button
        randomizeButton.layer.cornerRadius = 25
        randomizeButton.clipsToBounds = true
        randomizeButton.setTitleColor(.white, for: .normal)
        randomizeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        randomizeButton.layer.shadowColor = UIColor.systemBlue.cgColor
        randomizeButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        randomizeButton.layer.shadowRadius = 8
        randomizeButton.layer.shadowOpacity = 0.3
        randomizeButton.layer.masksToBounds = false
        
    }
    
    private func setupBackgroundImage() {
        // View background
        let backgroundImageViewMain = UIImageView(frame: view.bounds)
        backgroundImageViewMain.image = UIImage(named: "scrollViewBackground")
        backgroundImageViewMain.contentMode = .scaleAspectFill
        backgroundImageViewMain.alpha = 0.3
        backgroundImageViewMain.clipsToBounds = true
        
        view.insertSubview(backgroundImageViewMain, at: 0)
        
        backgroundImageViewMain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageViewMain.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageViewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

    }
    

    
    private func setupContentViewBackground() {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "supergeroBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.alpha = 0.2
        backgroundImage.clipsToBounds = true
        
        contentView.insertSubview(backgroundImage, at: 0)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    //IBActions
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        loadRandomSuperhero()
    }
    
    // Networking
    private func loadRandomSuperhero() {
        randomizeButton.isEnabled = false
        randomizeButton.alpha = 0.5
        
        NetworkManager.shared.fetchRandomSuperhero { [weak self] result in
            DispatchQueue.main.async {
                self?.randomizeButton.isEnabled = true
                self?.randomizeButton.alpha = 1.0
                
                switch result {
                case .success(let superhero):
                    self?.currentSuperhero = superhero
                    self?.updateUI(with: superhero)
                    self?.loadHeroImage(from: superhero.images.md)
                    
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
    
    private func loadHeroImage(from urlString: String) {
        heroImageView.image = UIImage(systemName: "person.circle.fill")
        
        NetworkManager.shared.loadImage(from: urlString) { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    UIView.transition(with: self?.heroImageView ?? UIImageView(),
                                    duration: 0.3,
                                    options: .transitionCrossDissolve,
                                    animations: {
                        self?.heroImageView.image = image
                    })
                }
            }
        }
    }
    
    //UI Updates
    private func updateUI(with superhero: Superhero) {
        nameLabel.text = superhero.name
        fullNameLabel.text = superhero.biography.fullName
        
        // Powerstats
        intelligenceLabel.text = "🧠 Intelligence: \(superhero.powerstats.intelligence)"
        strengthLabel.text = "💪 Strength: \(superhero.powerstats.strength)"
        speedLabel.text = "🏎️ Speed: \(superhero.powerstats.speed)"
        durabilityLabel.text = "🛡️ Durability: \(superhero.powerstats.durability)"
        powerLabel.text = "🔋 Power: \(superhero.powerstats.power)"
        combatLabel.text = "⚔️ Combat: \(superhero.powerstats.combat)"
        
        // Appearance
        genderLabel.text = "👤 Gender: \(superhero.appearance.gender)"
        raceLabel.text = "🧬 Race: \(superhero.appearance.race ?? "Unknown")"
        
        // Biography
        publisherLabel.text = "📚 Publisher: \(superhero.biography.publisher ?? "Unknown")"
        
        let alignmentEmoji = superhero.biography.alignment == "good" ? "😇" : superhero.biography.alignment == "bad" ? "😈" : "😐"
        alignmentLabel.text = "\(alignmentEmoji) Alignment: \(superhero.biography.alignment.capitalized)"
    }
    
    // Error Handling
    private func showError(_ error: NetworkError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            self.loadRandomSuperhero()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
}
