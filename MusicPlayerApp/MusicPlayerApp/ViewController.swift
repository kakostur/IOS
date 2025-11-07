

import UIKit
import AVFoundation

struct Song {
    let title: String
    let artist: String
    let coverImage: UIImage
    let fileName: String
}


class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    // Properties
    var songs: [Song] = []
    var currentSongIndex = 0
    var audioPlayer: AVAudioPlayer?
    var isPlaying = false
    
    // View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad started")
        
        setupUI()
        loadSongs()
        updateUI()
    }
    
    // Setup the look of the app
    func setupUI() {
        view.backgroundColor = .systemBackground
        songTitleLabel.textColor = .label
        artistLabel.textColor = .secondaryLabel
        
        coverImageView.layer.cornerRadius = 20
        coverImageView.layer.masksToBounds = true
        
        prevButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        prevButton.tintColor = .label
        playPauseButton.tintColor = .label
        nextButton.tintColor = .label

        
        print("UI setup complete")
    }
    
    //  Load all songs
    func loadSongs() {
        songs = [
            Song(title: "Attention", artist: "NewJeans", coverImage: UIImage(named: "attention") ?? UIImage(), fileName: "Attention"),
            Song(title: "Ditto", artist: "NewJeans", coverImage: UIImage(named: "ditto") ?? UIImage(), fileName: "Ditto"),
            Song(title: "New Jeans", artist: "NewJeans", coverImage: UIImage(named: "newjeanse") ?? UIImage(), fileName: "New Jeans"),
            Song(title: "OMG", artist: "NewJeans", coverImage: UIImage(named: "omg") ?? UIImage(), fileName: "OMG"),
            Song(title: "Super Shy", artist: "NewJeans", coverImage: UIImage(named: "superShy") ?? UIImage(), fileName: "Super Shy")
        ]

        print("Loaded \(songs.count) songs")
    }
    
    // Update the current song info on screen
    func updateUI() {
        let currentSong = songs[currentSongIndex]
        coverImageView.image = currentSong.coverImage
        songTitleLabel.text = currentSong.title
        artistLabel.text = currentSong.artist
    }
    
    // auto-transition to the next song
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Song finished playing")
        
        currentSongIndex = (currentSongIndex + 1) % songs.count
        updateUI()
        setupAudioPlayer()
        audioPlayer?.play()
    }
    
    //  Prepare the audio player
    func setupAudioPlayer() {
        let currentSong = songs[currentSongIndex]
        print("Searching file: songs/\(currentSong.fileName).mp3")
        
        // Try to find the file inside the "songs" folder
        if let url = Bundle.main.url(forResource: "songs/\(currentSong.fileName)", withExtension: "mp3") {
            print(" Found in folder: \(url.lastPathComponent)")
            createPlayer(from: url)
        }
        // If not found, try to find it directly in the main bundle
        else if let altUrl = Bundle.main.url(forResource: currentSong.fileName, withExtension: "mp3") {
            print("Found in main bundle: \(currentSong.fileName).mp3")
            createPlayer(from: altUrl)
        } else {
            print(" Song file not found anywhere!")
        }
    }
    
    // Create player with found file
    func createPlayer(from url: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            print("Audio player created successfully")
        } catch {
            print("Error: \(error)")
        }
    }
    
    //Buttons Actions
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        print("\n Previous button tapped")
        
        // Go to previous song (loop to last if at the beginning)
        currentSongIndex = (currentSongIndex == 0) ? songs.count - 1 : currentSongIndex - 1
        
        audioPlayer?.stop()
        isPlaying = false
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        updateUI()
        setupAudioPlayer()
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        print("\n Play/Pause button tapped")
        
        if isPlaying {
            // Pause music
            audioPlayer?.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            isPlaying = false
            print("⏸ Music paused")
        } else {
            // Play music
            if audioPlayer == nil {
                print("No player found. Creating a new one...")
                setupAudioPlayer()
            }
            
            if let player = audioPlayer {
                player.play()
                playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                isPlaying = true
                print(" Playback started")
            } else {
                print(" Could not start playback!")
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        print("\n⏭ Next button tapped")
        
        // Go to next song (loop to first if at the end)
        currentSongIndex = (currentSongIndex == songs.count - 1) ? 0 : currentSongIndex + 1
        
        audioPlayer?.stop()
        isPlaying = false
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        
        updateUI()
        setupAudioPlayer()
    }
}
