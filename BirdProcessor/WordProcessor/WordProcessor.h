#import <Foundation/Foundation.h>
#import "StringManipulatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WordProcessor : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithStringManipulator:(id<StringManipulatorProtocol>)stringManipulator;

- (NSString *)processInputString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
