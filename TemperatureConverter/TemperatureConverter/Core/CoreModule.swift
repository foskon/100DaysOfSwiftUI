import Foundation

public class CoreModule {
    public init() {}
    
    private(set) lazy var temperature: Temperature = buildTemperature()
    
    private func buildTemperature() -> Temperature {
        TemperatureEngine()
    }
}
