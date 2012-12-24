//
//  ViewController.m
//  version-ios
//
//  Created by Polat Olu on 24/12/2012.
//
//

#import "ViewController.h"
#import "Version.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtVersion1;
@synthesize txtVersion2;
@synthesize lblResult;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkVersion:(id)sender {
    // Get the texts
    NSString *v1Text = [self.txtVersion1 text];
    NSString *v2Text = [self.txtVersion2 text];
    
    // Create version objects
    Version *v1 = [[[Version alloc] initWithString:v1Text] autorelease];
    Version *v2 = [[[Version alloc] initWithString:v2Text] autorelease];
    
    // Compare and show the result
    NSComparisonResult result = [v1 compare:v2];
    
    switch (result) {
        case NSOrderedAscending:
            [self.lblResult setText:@"Version 1 is bigger"];
            break;
            
        case NSOrderedDescending:
            [self.lblResult setText:@"Version 1 is smaller"];
            break;

        case NSOrderedSame:
            [self.lblResult setText:@"Versions are same"];
            break;
            
        default:
            [self.lblResult setText:@"Undeterminated"];
            break;
    }
    
}

@end
