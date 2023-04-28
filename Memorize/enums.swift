import Foundation

enum Theme: (String), CaseIterable, Identifiable{
    case countryFlags = "Flags"
    case transports = "Transports"
    case animals = "Animals"
    var id: Self { self }
}

