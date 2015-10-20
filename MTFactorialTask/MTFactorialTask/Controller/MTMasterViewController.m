//
//  MTMasterViewController.m
//  MTFactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import "MTMasterViewController.h"
#import "MTFactorialCalculator.h"

@interface MTMasterViewController ()

@property (nonatomic, strong) MTFactorialCalculator *factorialCalculator;
@property NSMutableArray *objects;

@end

@implementation MTMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.tableHeaderView = nil;
    
    _factorialCalculator = [[MTFactorialCalculator alloc] init];
    self.factorialCalculator.output = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IB Actions

- (IBAction)calculateButtonPressed:(id)sender
{
    if ([self.textFieldNumber.text length] == 0) {
        self.textFieldNumber.text = @"0";
    }
    
    [self.textFieldNumber resignFirstResponder];
    [self clearTableData];
    
    //convert string to unsigned value
    unsigned long ulvalue = strtoul([self.textFieldNumber.text UTF8String], NULL, 0);
    
    //convert unsigned value to string
    self.textFieldNumber.text = [NSString stringWithFormat:@"%lu", ulvalue];
    
    [self.factorialCalculator calculateFactorialRecordsWithLimit:@(ulvalue)];
}

- (IBAction)ulongButtonPressed:(id)sender
{
    self.textFieldNumber.text = [NSString stringWithFormat:@"%lu", ULONG_MAX];
}

#pragma mark - UI

- (void)showRecordInLog:(NSString *)record
{
    NSLog(@"%@", record);
}

- (void)showRecordInTableView:(NSString *)record
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:record
                       atIndex:[self.objects count]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.tableView numberOfRowsInSection:0] inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)clearTableData
{
    [self.objects removeAllObjects];
    [self.tableView reloadData];
}

#pragma mark - MTFactorialCalculatorOutputInterface

- (void)onDidCalculateFactorialRecord:(NSString *)record
{
    [self showRecordInTableView:record];
    //    [self showRecordInLog:record];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

@end
