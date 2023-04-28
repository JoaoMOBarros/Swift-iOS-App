import Foundation

enum ThemesSupported: (String), CaseIterable, Identifiable{
    case countryFlags = "Flags"
    case transports = "Transports"
    case animals = "Animals"
    var id: Self { self }
}

