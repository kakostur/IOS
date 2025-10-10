import Foundation

struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    // Computed property using reduce to sum item quantities
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    // Creates immutable order snapshot from shopping cart
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
}

extension Order {
    func displayOrder() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        // Print order header
        print("\n" + String(repeating: "=", count: 50))
        print("ORDER CONFIRMATION")
        print(String(repeating: "=", count: 50))
        print("Order ID: \(orderId)")
        print("Date: \(dateFormatter.string(from: timestamp))")
        
        print("\nShipping Address:")
        print(shippingAddress.formattedAddress)
        
        // Print order items
        print("\n" + String(repeating: "-", count: 50))
        print("ORDER ITEMS:")
        
        for (index, item) in items.enumerated() {
            print("\n\(index + 1). \(item.product.name)")
            print("   Quantity: \(item.quantity)")
            print("   Price: \(item.product.displayPrice) each")
            print("   Subtotal: \(String(format: "$%.2f", item.subtotal))")
        }
        
        // Print order summary
        print("\n" + String(repeating: "-", count: 50))
        print("Subtotal: \(String(format: "$%.2f", subtotal))")
        
        if discountAmount > 0 {
            print("Discount: -\(String(format: "$%.2f", discountAmount))")
        }
        
        print("TOTAL: \(String(format: "$%.2f", total))")
        print("Total Items: \(itemCount)")
        print(String(repeating: "=", count: 50) + "\n")
    }
}
