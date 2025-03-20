#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StringManipulatorProtocol <NSObject>

- (BOOL)isEmptyString:(NSString *)string;

@optional

- (NSInteger)numberOfWordsInString:(NSString *)string;

@required

- (NSInteger)numberOfCharactersInString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
