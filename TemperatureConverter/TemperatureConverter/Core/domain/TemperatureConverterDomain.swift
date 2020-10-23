import Foundation

public enum TemperatureError: Error {
    case general
}

public enum TemperatureUnit: CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
}
