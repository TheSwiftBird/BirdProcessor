@objc class StringManipulator: NSObject { }

extension StringManipulator: StringManipulatorProtocol {
    
    func isEmpty(_ string: String) -> Bool {
        string.isEmpty
    }
    
    func numberOfCharacters(in string: String) -> Int {
        string.count
    }
    
}
