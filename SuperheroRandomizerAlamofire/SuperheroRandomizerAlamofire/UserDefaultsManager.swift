import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private init() {}
    
    private let lastSuperheroKey = "lastSuperhero"
    
    //  Save Superhero
    func saveSuperhero(_ superhero: Superhero) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(superhero)
            UserDefaults.standard.set(data, forKey: lastSuperheroKey)
            print(" Superhero saved: \(superhero.name)")
        } catch {
            print("❌ Failed to save superhero: \(error)")
        }
    }
    
    //Load Superhero
    func loadSuperhero() -> Superhero? {
        guard let data = UserDefaults.standard.data(forKey: lastSuperheroKey) else {
            print(" No saved superhero found")
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let superhero = try decoder.decode(Superhero.self, from: data)
            print(" Loaded superhero: \(superhero.name)")
            return superhero
        } catch {
            print("❌ Failed to load superhero: \(error)")
            return nil
        }
    }
    
    //Clear Superhero (Optional)
    func clearSuperhero() {
        UserDefaults.standard.removeObject(forKey: lastSuperheroKey)
        print(" Superhero data cleared")
    }
}
