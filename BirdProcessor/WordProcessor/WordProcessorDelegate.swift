@objc protocol WordProcessorDelegate {
    @objc optional func wordProcessor(_ processor: WordProcessor, didBeginProcessingInput string: String)
    @objc optional func wordProcessor(_ processor: WordProcessor, didFinishProcessingInput string: String)
    @objc optional func wordProcessor(_ processor: WordProcessor, didEncounterError error: String)
}
