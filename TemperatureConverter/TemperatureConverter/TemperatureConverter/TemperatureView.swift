import SwiftUI
import Core

class TemperatureViewModel: ObservableObject {
    private let temperature: Temperature = CoreInjector.converter
    
    let availableUnits: ViewTemperatureUnit.AllCases = TemperatureUnit.allCases.map(toViewTemperatureUnit)
    
    @Published var fromValue: String = "0" { didSet { updateToUnit() } }
    @Published var fromUnitSegmentedIndex = 0 { didSet { updateToUnit() } }
    
    @Published var toValue: String = "0"
    @Published var toUnitSegmentedIndex = 0  { didSet { updateToUnit() } }
    
    private func updateToUnit() {
        let rawToValue = temperature.convert(
            Double(fromValue) ?? 0,
            fromUnit: toTemperatureUnit(ViewTemperatureUnit(rawValue: fromUnitSegmentedIndex) ?? .celsius),
            toUnit: toTemperatureUnit(ViewTemperatureUnit(rawValue: toUnitSegmentedIndex) ?? .celsius)
        )
        toValue = String(format: "%.2f", rawToValue)
    }
}

enum ViewTemperatureUnit: Int, CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
}



struct TemperatureView: View {
    @ObservedObject var model: TemperatureViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From unit")) {
                    TextField("Value", text: $model.fromValue)
                        .keyboardType(.decimalPad)
                    Picker("From unit", selection: $model.fromUnitSegmentedIndex) {
                        ForEach(0 ..< model.availableUnits.count) {
                            Text(toString(self.model.availableUnits[$0]))
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To unit")) {
                    Text("\(model.toValue)")
                    Picker("From unit", selection: $model.toUnitSegmentedIndex) {
                        ForEach(0 ..< model.availableUnits.count) {
                            Text(toString(self.model.availableUnits[$0]))
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Temperature Converter")
        }
    }
}

private func toTemperatureUnit(_ unit: ViewTemperatureUnit) -> TemperatureUnit {
    switch unit {
    case .celsius: return .celsius
    case .fahrenheit: return .fahrenheit
    case .kelvin: return .kelvin
    }
}

private func toViewTemperatureUnit(_ unit: TemperatureUnit) -> ViewTemperatureUnit {
    switch unit {
    case .celsius: return .celsius
    case .fahrenheit: return .fahrenheit
    case .kelvin: return .kelvin
    }
}

private func toString(_ unit: ViewTemperatureUnit) -> String {
    switch unit {
    case .celsius: return "Celsius"
    case .fahrenheit: return "Fahrenheit"
    case .kelvin: return "Kelvin"
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(model: TemperatureViewModel.previewData)
    }
}



private extension TemperatureViewModel {
    static let previewData = TemperatureViewModel()
}
