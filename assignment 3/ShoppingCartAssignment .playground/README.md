# Shopping Cart System - Implementation Report

## Class vs Struct Design Choices

### Why ShoppingCart is a Class
I created a class called `ShoppingCart` because it encapsulates a shared state with a unique identity that must persist throughout the application. The shopping cart stores mutable data, such as items and discount codes, and it should be passed by reference so that different parts of the application can modify the same cart instance. For example, if a user adds items in one view controller and then applies discounts in another, both should be able to access the same cart object. Classes provide the necessary reference semantics for this shared, mutable state.

### Why Product and Order are Structs
The concepts of `Product` and `Order` are implemented as structures because they represent **unchangeable data values** rather than entities with a distinct identity. The attributes of a product, such as its name, price, and category, do not undergo alterations, and an order represents a **fixed point in time** that should remain unaltered once it is created. By employing value semantics, we ensure that when we pass products or orders throughout the application, we are working with independent copies that cannot be unintentionally modified. This approach aligns with Swift's preference for using value types for simple data containers.

## Reference Semantics in Practice
In the test scenarios, reference semantics are crucial when passing the `ShoppingCart` to the `modifyCart()` function. When this function adds headphones to the cart, the **original cart is modified** because classes are reference types. This behavior is essential for the shopping cart's purpose - multiple parts of the application (view controllers, helper functions) need to modify the same cart instance rather than working with copies.

## Value Semantics in Practice
Value semantics are demonstrated when working with `CartItem` instances. When I create `item2` as a copy of `item1` and then modify `item2`'s quantity, the **original `item1` remains unchanged**. This prevents accidental data corruption and makes reasoning about code easier. Each cart item maintains its own independent state, which is crucial when calculating subtotals or updating quantities without affecting other items.

## Implementation Challenges and Solutions

The main challenge was **managing mutation in value types**. Since structs are copied on assignment, updating a `CartItem`'s quantity within the `ShoppingCart`'s items array required careful handling. I solved this by:

1. Using `mutating` methods in `CartItem` for controlled state changes
2. Implementing proper copy-on-write patterns when updating items in the cart
3. Using `private(set)` to enforce encapsulation while allowing read access

Another challenge was **maintaining data consistency** between the shopping cart and orders. I addressed this by making `Order` an immutable snapshot that copies all relevant data from the cart at creation time. This ensures orders remain consistent even if the original cart is modified later.

The initializers for `Product` and `CartItem` that could fail ensured data validation, allowing only valid objects to be created. This proactive approach to error handling prevented many potential problems that could have occurred at runtime, such as negative prices or quantities.


To sum up, the meticulous choice between value and reference types, coupled with effective encapsulation, has led to the creation of a resilient shopping cart system that operates reliably and preserves data accuracy throughout the user's shopping journey.

