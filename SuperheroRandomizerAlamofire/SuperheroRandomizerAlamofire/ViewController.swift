import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    //IBOutlets
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
    
    // MARK: - Properties
    private var currentSuperhero: Superhero?
    private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupContentViewBackground()
        setupUI()
        setupActivityIndicator()
        loadInitialSuperhero()
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        title = "Superhero Randomizer"
        
        // Configure hero image view
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        heroImageView.contentMode = .scaleAspectFill
        
        // Configure randomize button with visual effects
        randomizeButton.layer.cornerRadius = 25
        randomizeButton.clipsToBounds = true
        randomizeButton.setTitleColor(.white, for: .normal)
        randomizeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        // Add shadow effect to button
        randomizeButton.layer.shadowColor = UIColor.systemBlue.cgColor
        randomizeButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        randomizeButton.layer.shadowRadius = 8
        randomizeButton.layer.shadowOpacity = 0.3
        randomizeButton.layer.masksToBounds = false
        
        // Adjust spacing in stack view if labels are inside one
        if let stackView = nameLabel.superview as? UIStackView {
            stackView.setCustomSpacing(16, after: heroImageView)
            stackView.setCustomSpacing(4, after: nameLabel)
            stackView.setCustomSpacing(12, after: fullNameLabel)
            stackView.setCustomSpacing(16, after: combatLabel)
            stackView.setCustomSpacing(16, after: raceLabel)
            stackView.setCustomSpacing(28, after: alignmentLabel)
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupBackgroundImage() {
        let backgroundImageViewMain = UIImageView()
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
    
    // MARK: - Data Loading
    
    private func loadInitialSuperhero() {
        // Check if there's a saved superhero in UserDefaults
        if let savedSuperhero = UserDefaultsManager.shared.loadSuperhero() {
            print("Loading saved superhero from UserDefaults")
            currentSuperhero = savedSuperhero
            updateUI(with: savedSuperhero)
            loadHeroImage(from: savedSuperhero.images.md)
        } else {
            print(" No saved superhero found, loading random one")
            loadRandomSuperhero()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        // Button tap animation
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
        
        loadRandomSuperhero()
    }
    
    // MARK: - Networking
    
    private func loadRandomSuperhero() {
        activityIndicator.startAnimating()
        randomizeButton.isEnabled = false
        randomizeButton.alpha = 0.5
        
        NetworkManager.shared.fetchRandomSuperhero { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.randomizeButton.isEnabled = true
                self?.randomizeButton.alpha = 1.0
                
                switch result {
                case .success(let superhero):
                    self?.currentSuperhero = superhero
                    self?.updateUI(with: superhero)
                    self?.loadHeroImage(from: superhero.images.md)
                    
                    // Save the superhero to UserDefaults for persistence
                    UserDefaultsManager.shared.saveSuperhero(superhero)
                    print(" Superhero saved to UserDefaults")
                    
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
    
    // MARK: - Image Loading
    
    private func loadHeroImage(from urlString: String) {
        heroImageView.kf.indicatorType = .activity
        
        let url = URL(string: urlString)
        heroImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "person.circle.fill"),
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ]
        ) { result in
            switch result {
            case .success(let value):
                print("✅ Image loaded successfully: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("❌ Failed to load image: \(error)")
                // Could set a default error image here
            }
        }
    }
    
    // MARK: - UI Updates
    
    private func updateUI(with superhero: Superhero) {
        // Fade out animation before updating text
        UIView.animate(withDuration: 0.2, animations: {
            self.nameLabel.alpha = 0
            self.fullNameLabel.alpha = 0
        }) { _ in
            // Update all labels with superhero data
            self.nameLabel.text = superhero.name
            self.fullNameLabel.text = superhero.biography.fullName
            
            // Powerstats with emojis
            self.intelligenceLabel.text = "🧠 Intelligence: \(superhero.powerstats.intelligence)"
            self.strengthLabel.text = "💪 Strength: \(superhero.powerstats.strength)"
            self.speedLabel.text = "🏎️ Speed: \(superhero.powerstats.speed)"
            self.durabilityLabel.text = "🛡️ Durability: \(superhero.powerstats.durability)"
            self.powerLabel.text = "🔋 Power: \(superhero.powerstats.power)"
            self.combatLabel.text = "⚔️ Combat: \(superhero.powerstats.combat)"
            
            // Appearance information
            self.genderLabel.text = "👤 Gender: \(superhero.appearance.gender)"
            self.raceLabel.text = "🧬 Race: \(superhero.appearance.race ?? "Unknown")"
            
            // Biography information
            self.publisherLabel.text = "📚 Publisher: \(superhero.biography.publisher ?? "Unknown")"
            
            // Alignment with appropriate emoji
            let alignmentEmoji = superhero.biography.alignment == "good" ? "😇" :
                                 superhero.biography.alignment == "bad" ? "😈" : "😐"
            self.alignmentLabel.text = "\(alignmentEmoji) Alignment: \(superhero.biography.alignment.capitalized)"
            
            // Fade in animation after updating text
            UIView.animate(withDuration: 0.3) {
                self.nameLabel.alpha = 1
                self.fullNameLabel.alpha = 1
            }
        }
    }
    
    // MARK: - Error Handling
    
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
