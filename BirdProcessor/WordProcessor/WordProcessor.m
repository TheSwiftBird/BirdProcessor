#import "WordProcessor.h"

@interface WordProcessor ()

@property (nonatomic) id<StringManipulatorProtocol> stringManipulator;

@end

@implementation WordProcessor

- (instancetype)initWithStringManipulator:(id<StringManipulatorProtocol>)stringManipulator {
    self = [super init];
    if (self) {
        self.stringManipulator = stringManipulator;
    }
    return self;
}

- (NSString *)processInputString:(NSString *)string {
    if (self.stringManipulator == nil) {
        return @"stringManipulator is nil!";
    }
    
    BOOL isEmpty = [self.stringManipulator isEmptyString:string];
    NSString *isEmptyResult = isEmpty ? @"is" : @"is not";
    
    NSInteger numberOfWords = [self.stringManipulator numberOfWordsInString:string];
    NSString *numberOfWordsResult = [NSString stringWithFormat:@"%ld word(s) and ", numberOfWords];
    
    NSInteger numberOfCharacters = [self.stringManipulator numberOfCharactersInString:string];
    NSString *numberOfCharactersResult = [NSString stringWithFormat:@"%ld character(s)", numberOfCharacters];
    
    return [NSString stringWithFormat:@"The string %@ empty. It has %@%@.",
            isEmptyResult,
            numberOfWordsResult,
            numberOfCharactersResult];
}

@end
