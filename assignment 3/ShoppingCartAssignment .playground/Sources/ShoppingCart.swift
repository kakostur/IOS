import Foundation

class ShoppingCart {
    // Private setter prevents external modification of items array
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    // Explicit initializer for class
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else {
            print("Error: Quantity must be positive")
            return
        }
        
        // Check if product already exists using firstIndex(where:)
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            // Update existing item quantity - requires mutating copy
            var existingItem = items[index]
            existingItem.increaseQuantity(by: quantity)
            items[index] = existingItem
            print("Updated \(product.name) quantity to \(items[index].quantity)")
        } else {
            // Add new item using failable CartItem initializer
            if let newItem = CartItem(product: product, quantity: quantity) {
                items.append(newItem)
                print("Added \(product.name) to cart")
            }
        }
    }
    
    func removeItem(productId: String) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            let removedProduct = items[index].product.name
            items.remove(at: index)
            print("Removed \(removedProduct) from cart")
        } else {
            print("Product not found in cart")
        }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.product.id == productId }) else {
            print("Product not found in cart")
            return
        }
        
        if quantity == 0 {
            removeItem(productId: productId)
        } else if quantity > 0 {
            items[index].updateQuantity(quantity)
            print("Updated quantity to \(quantity)")
        } else {
            print("Error: Quantity must be non-negative")
        }
    }
    
    func clearCart() {
        items.removeAll()
        discountCode = nil
        print("Cart cleared")
    }
    
    // Computed property using reduce to calculate sum
    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal }
    }
    
    // Computed property with switch statement for discount calculation
    var discountAmount: Double {
        guard let code = discountCode else { return 0 }
        
        switch code.uppercased() {
        case "SAVE10":
            return subtotal * 0.10
        case "SAVE20":
            return subtotal * 0.20
        case "SAVE30":
            return subtotal * 0.30
        default:
            return 0
        }
    }
    
    var total: Double {
        return max(0, subtotal - discountAmount) 
    }
    
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}

extension ShoppingCart {
    func displayCart() {
        print("\n" + String(repeating: "=", count: 50))
        print("SHOPPING CART")
        print(String(repeating: "=", count: 50))
        
        if isEmpty {
            print("Your cart is empty")
        } else {
            // Enumerated loop to display items with numbers
            for (index, item) in items.enumerated() {
                print("\n\(index + 1). \(item.product.name)")
                print("   Quantity: \(item.quantity)")
                print("   Price: \(item.product.displayPrice) each")
                print("   Subtotal: \(String(format: "$%.2f", item.subtotal))")
            }
            
            print("\n" + String(repeating: "-", count: 50))
            print("Subtotal: \(String(format: "$%.2f", subtotal))")
            
            // Conditional discount display
            if let code = discountCode, discountAmount > 0 {
                print("Discount (\(code)): -\(String(format: "$%.2f", discountAmount))")
            }
            
            print("Total: \(String(format: "$%.2f", total))")
            print("Total Items: \(itemCount)")
        }
        
        print(String(repeating: "=", count: 50) + "\n")
    }
}
