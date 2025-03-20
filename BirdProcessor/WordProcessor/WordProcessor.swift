// Because this class is used in Objective-C, we still need `@objc` and `NSObject`:
@objc class WordProcessor: NSObject {
    
    private let stringManipulator: any StringManipulatorProtocol
    
    @objc init(stringManipulator: any StringManipulatorProtocol) {
        self.stringManipulator = stringManipulator
    }
    
    @objc func processInputString(_ string: String) -> String {
        let isEmpty = stringManipulator.isEmpty(string)
        let isEmptyResult = isEmpty ? "is" : "is not"
        
        var numberOfWordsResult = ""
        if stringManipulator.responds(to: #selector(StringManipulatorProtocol.numberOfWords(in:))) {
            // Note the ! before the arguments:
            let numberOfWords = stringManipulator.numberOfWords!(in: string)
            numberOfWordsResult = "\(numberOfWords) word(s) and "
        }
        
        let numberOfCharacters = stringManipulator.numberOfCharacters(in: string)
        let numberOfCharactersResult = "\(numberOfCharacters) character(s)"
        
        return "The string \(isEmptyResult) empty. It has \(numberOfWordsResult)\(numberOfCharactersResult)."
    }
    
}
