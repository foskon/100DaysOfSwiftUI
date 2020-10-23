import Foundation

public class CoreInjector {
    private static var injector: Injector!
    
    static public var converter: Temperature { CoreInjector.injector.core.temperature }
    
    public static func initialize(_ injector: Injector) {
        self.injector = injector
    }
    
    public class Injector {
        public let core: CoreModule
        
        public init(_ core: CoreModule) {
            self.core = core
        }
    }
}
