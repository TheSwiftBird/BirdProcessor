#import "BirdProcessor-Swift.h"
#import "ViewController.h"

@interface ViewController () <WordProcessorDelegate>

@property (nonatomic) WordProcessor *wordProcessor;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<StringManipulatorProtocol> stringManipulator = [[StringManipulator alloc] init];
    self.wordProcessor = [[WordProcessor alloc] initWithStringManipulator:stringManipulator];
    self.wordProcessor.delegate = self;
}

- (IBAction)didTapProcessButton:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *input = self.inputTextField.text;
    NSString *processingResult = [self.wordProcessor processInputString:input];
    [self.resultLabel setText:processingResult];
}

// We’re only interested in the third method, but the compiler requires all three:

- (void)wordProcessor:(WordProcessor *)processor didBeginProcessingInput:(NSString *)string {
    
}

- (void)wordProcessor:(WordProcessor *)processor didFinishProcessingInput:(NSString *)string {
    
}

- (void)wordProcessor:(WordProcessor *)processor didEncounterError:(NSString *)error {
    // Show an error alert
}

@end
