@objc protocol WordProcessorDelegate {
    func wordProcessor(_ processor: WordProcessor, didBeginProcessingInput string: String)
    func wordProcessor(_ processor: WordProcessor, didFinishProcessingInput string: String)
    func wordProcessor(_ processor: WordProcessor, didEncounterError error: String)
}
