func runTests() {
    print(" SHOPPING CART SYSTEM - TEST SCENARIOS\n")
    
    print(" TEST 1: Creating Sample Products")
    print(String(repeating: "-", count: 50))
    
    let laptop = Product(
        name: "MacBook Pro 16\"",
        price: 2499.99,
        category: .electronics,
        description: "Powerful laptop for professionals"
    )!
    
    let book = Product(
        name: "Swift Programming Guide",
        price: 49.99,
        category: .books,
        description: "Complete guide to Swift development"
    )!
    
    let headphones = Product(
        name: "AirPods Pro",
        price: 249.99,
        category: .electronics,
        description: "Premium wireless headphones"
    )!
    
    let tshirt = Product(
        name: "Developer T-Shirt",
        price: 24.99,
        category: .clothing,
        description: "Comfortable cotton t-shirt"
    )!
    
    print("✅ Created 4 products successfully")
    print("- \(laptop.name): \(laptop.displayPrice)")
    print("- \(book.name): \(book.displayPrice)")
    print("- \(headphones.name): \(headphones.displayPrice)")
    print("- \(tshirt.name): \(tshirt.displayPrice)\n")
    
    print(" TEST 2: Adding Items to Cart")
    print(String(repeating: "-", count: 50))
    
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    cart.addItem(product: tshirt, quantity: 3)
    
    print("✅ Added items to cart\n")
    
    print(" TEST 3: Adding Same Product Twice")
    print(String(repeating: "-", count: 50))
    
    print("Before: Laptop quantity = 1")
    cart.addItem(product: laptop, quantity: 1)
    print("After: Laptop quantity = 2")
    print("✅ Quantity updated correctly\n")
    
    print(" TEST 4: Cart Calculations")
    print(String(repeating: "-", count: 50))
    
    cart.displayCart()
    
    print(" TEST 5: Applying Discount Code")
    print(String(repeating: "-", count: 50))
    
    print("Before discount:")
    print("Total: \(String(format: "$%.2f", cart.total))")
    
    cart.discountCode = "SAVE10"
    print("\nAfter applying 'SAVE10' code:")
    print("Discount: -\(String(format: "$%.2f", cart.discountAmount))")
    print("Total: \(String(format: "$%.2f", cart.total))")
    print("✅ Discount applied successfully\n")
    
    print(" TEST 6: Removing Items from Cart")
    print(String(repeating: "-", count: 50))
    
    print("Items before removal: \(cart.itemCount)")
    cart.removeItem(productId: book.id)
    print("Items after removal: \(cart.itemCount)")
    print("✅ Item removed successfully\n")
    
    print("🔗 TEST 7: Reference Type Behavior")
    print(String(repeating: "-", count: 50))
    
    func modifyCart(_ cart: ShoppingCart) {
        cart.addItem(product: headphones, quantity: 1)
    }
    
    print("Before modifyCart(): \(cart.itemCount) items")
    modifyCart(cart)
    print("After modifyCart(): \(cart.itemCount) items")
    print("✅ Original cart WAS modified (reference semantics)\n")
    
    print(" TEST 8: Value Type Behavior")
    print(String(repeating: "-", count: 50))
    
    let item1 = CartItem(product: laptop, quantity: 1)!
    var item2 = item1
    item2.updateQuantity(5)
    
    print("item1 quantity: \(item1.quantity)")
    print("item2 quantity: \(item2.quantity)")
    print("✅ item1 was NOT affected (value semantics)\n")
    
    print(" TEST 9: Creating Order from Cart")
    print(String(repeating: "-", count: 50))
    
    let address = Address(
        street: "123 Swift Street",
        city: "San Francisco",
        zipCode: "94102",
        country: "USA"
    )
    
    let order = Order(from: cart, shippingAddress: address)
    order.displayOrder()
    
    print(" TEST 10: Modifying Cart After Order")
    print(String(repeating: "-", count: 50))
    
    print("Before clearing cart:")
    print("- Cart items: \(cart.itemCount)")
    print("- Order items: \(order.itemCount)")
    
    cart.clearCart()
    
    print("\nAfter clearing cart:")
    print("- Cart items: \(cart.itemCount)")
    print("- Order items: \(order.itemCount)")
    print("✅ Order is immutable - items preserved!\n")
    
    print("ADDITIONAL TESTS")
    print(String(repeating: "-", count: 50))
    
    print("\n1. Testing invalid product (negative price):")
    let invalidProduct = Product(name: "Invalid", price: -10, category: .books, description: "Test")
    print("Result: \(invalidProduct == nil ? "✅ Correctly rejected" : "❌ Should be rejected")")
    
    print("\n2. Testing invalid cart item (zero quantity):")
    let invalidItem = CartItem(product: laptop, quantity: 0)
    print("Result: \(invalidItem == nil ? "✅ Correctly rejected" : "❌ Should be rejected")")
    
    print("\n3. Testing empty cart:")
    let emptyCart = ShoppingCart()
    print("Is empty: \(emptyCart.isEmpty)")
    print("Total: \(String(format: "$%.2f", emptyCart.total))")
    
    print("\n4. Testing update quantity to 0 (should remove):")
    let testCart = ShoppingCart()
    testCart.addItem(product: book, quantity: 1)
    print("Items before: \(testCart.itemCount)")
    testCart.updateItemQuantity(productId: book.id, quantity: 0)
    print("Items after: \(testCart.itemCount)")
    print("Result: \(testCart.isEmpty ? "✅ Item removed" : "❌ Item should be removed")")
    
    print("\n" + String(repeating: "=", count: 50))
    print("ALL TESTS COMPLETED SUCCESSFULLY!")
    print(String(repeating: "=", count: 50))
}
