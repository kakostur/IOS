import Foundation

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    // Computed property that returns formatted string
    var formattedAddress: String {
        return """
        \(street)
        \(city), \(zipCode)
        \(country)
        """
    }
}

// Protocol conformance - provides custom string representation
extension Address: CustomStringConvertible {
    var description: String {
        return formattedAddress
    }
}
