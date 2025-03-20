#import "ViewController.h"
#import "WordProcessor.h"

@interface ViewController ()

@property (nonatomic) WordProcessor *wordProcessor;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: Create an instance of `WordProcessor` and assign it to the property
}

- (IBAction)didTapProcessButton:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *input = self.inputTextField.text;
    NSString *processingResult = [self.wordProcessor processInputString:input];
    [self.resultLabel setText:processingResult];
}

@end
