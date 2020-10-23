import Foundation

class TemperatureEngine: Temperature {
    func convert(_ value: Double, fromUnit: TemperatureUnit, toUnit: TemperatureUnit) -> Double  {
        toUnit.fromCelsius(fromUnit.toCelsius(value))
    }
}


private extension TemperatureUnit {
    func toCelsius(_ value: Double) -> Double {
        switch self {
        case .celsius: return value
        case .fahrenheit: return (value - 32) * 5/9
        case .kelvin: return value - 273.15
        }
    }
    
    func fromCelsius(_ value: Double) -> Double {
        switch self {
        case .celsius: return value
        case .fahrenheit: return (value * 9/5) + 32
        case .kelvin: return value + 273.15
        }
    }
}
