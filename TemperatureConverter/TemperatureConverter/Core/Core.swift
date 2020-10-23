import Foundation

public protocol Temperature {
    func convert(_ value: Double, fromUnit: TemperatureUnit, toUnit: TemperatureUnit) -> Double
}
