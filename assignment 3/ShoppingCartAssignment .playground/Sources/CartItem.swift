import Foundation

struct CartItem {
    let product: Product
    private(set) var quantity: Int  // Private setter - can only be modified internally
    
    // Computed property - calculates price dynamically
    var subtotal: Double {
        return product.price * Double(quantity)  
    }
    
    // Failable initializer - returns nil if validation fails
    init?(product: Product, quantity: Int) {
        guard quantity > 0 else {
            print("Error: Quantity must be positive")
            return nil
        }
        
        self.product = product
        self.quantity = quantity
    }
    
    // Mutating method - required to modify struct properties
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("Error: Quantity must be positive")
            return
        }
        quantity = newQuantity
    }
    
    // Mutating method - modifies struct state
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else {
            print("Error: Amount must be positive")
            return
        }
        quantity += amount  // Compound assignment operator
    }
}

// Protocol conformance - custom string representation
extension CartItem: CustomStringConvertible {
    var description: String {
        return """
        \(product.name) x\(quantity)
        Unit Price: \(product.displayPrice)
        Subtotal: \(String(format: "$%.2f", subtotal)) 
        """
    }
}
