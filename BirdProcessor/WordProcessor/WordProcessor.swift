// Because this class is used in Objective-C, we still need `@objc` and `NSObject`:
@objc class WordProcessor: NSObject {
    
    private let stringManipulator: any StringManipulatorProtocol
    
    @objc weak var delegate: (any WordProcessorDelegate)?
    
    @objc init(stringManipulator: any StringManipulatorProtocol) {
        self.stringManipulator = stringManipulator
    }
    
    @objc func processInputString(_ string: String) -> String {
        delegate?.wordProcessor(self, didBeginProcessingInput: string)
        // This runs *after* the resulting string is constructed
        // but *before* control is returned to the caller—
        // in other words, when processing is truly finished
        defer { delegate?.wordProcessor(self, didFinishProcessingInput: string) }
        
        let isEmpty = stringManipulator.isEmpty(string)
        let isEmptyResult = isEmpty ? "is" : "is not"
        
        // Note the ? before the arguments:
        let numberOfWordsResult = if let numberOfWords = stringManipulator.numberOfWords?(in: string) {
            "\(numberOfWords) word(s) and "
        } else { "" }
        
        if numberOfWordsResult.isEmpty {
            delegate?.wordProcessor(self, didEncounterError: "Cannot count words")
        }
        
        let numberOfCharacters = stringManipulator.numberOfCharacters(in: string)
        let numberOfCharactersResult = "\(numberOfCharacters) character(s)"
        
        return "The string \(isEmptyResult) empty. It has \(numberOfWordsResult)\(numberOfCharactersResult)."
    }
    
}
