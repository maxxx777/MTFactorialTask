//
//  MTMasterViewController.h
//  MTFactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTFactorialCalculatorIOInterface.h"

@interface MTMasterViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
MTFactorialCalculatorOutputInterface
>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UITextField *textFieldNumber;
@property (nonatomic, strong) IBOutlet UIButton *buttonCalculate;

- (IBAction)calculateButtonPressed:(id)sender;
- (IBAction)ulongButtonPressed:(id)sender;

@end

