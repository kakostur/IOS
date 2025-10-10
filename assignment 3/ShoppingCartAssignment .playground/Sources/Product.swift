import Foundation

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    // Enum with raw values for display
    enum Category: String {
        case electronics = "Electronics"
        case clothing = "Clothing"
        case food = "Food"
        case books = "Books"
    }
    
    // Computed property for formatted price display
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
    
    // Failable initializer with parameter validation
    init?(id: String = UUID().uuidString, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {
            print("Error: Price must be positive")
            return nil
        }
        
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

extension Product: CustomStringConvertible {
    // Custom string representation using multi-line string literal
    var description: String {
        return """
        \(name) (\(category.rawValue))
        Price: \(displayPrice)
        """
    }
}
