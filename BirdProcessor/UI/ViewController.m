#import "BirdProcessor-Swift.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) WordProcessor *wordProcessor;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<StringManipulatorProtocol> stringManipulator = [[StringManipulator alloc] init];
    self.wordProcessor = [[WordProcessor alloc] initWithStringManipulator:stringManipulator];
}

- (IBAction)didTapProcessButton:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *input = self.inputTextField.text;
    NSString *processingResult = [self.wordProcessor processInputString:input];
    [self.resultLabel setText:processingResult];
}

@end
