//
//  ViewController.h
//  version-ios
//
//  Created by Polat Olu on 24/12/2012.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *txtVersion1;
@property (nonatomic, retain) IBOutlet UITextField *txtVersion2;
@property (nonatomic, retain) IBOutlet UILabel *lblResult;

- (IBAction)checkVersion:(id)sender;

@end
