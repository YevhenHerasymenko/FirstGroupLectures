//
//  TestTableViewController.m
//  Lesson 25
//
//  Created by Yevhen Herasymenko on 05/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "TestTableViewController.h"
#import "CustomView.h"
#import "CustomCell.h"

@interface TestTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableVIew;
@property (strong, nonatomic) NSMutableArray<NSString *> *strings;


@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.strings = [[NSMutableArray alloc] initWithArray:@[@"Vasia", @"Petia", @"Oleksii", @"Ololosha", @"Moss", @"Bobby", @"Lala", @"Tony", @"Vasia", @"Petia", @"Oleksii", @"Ololosha", @"Moss", @"Bobby", @"Lala", @"Tony", @"Vasia", @"Petia", @"Oleksii", @"Ololosha", @"Moss", @"Bobby", @"Lala", @"Tony", @"Vasia", @"Petia", @"Oleksii", @"Ololosha", @"Moss", @"Bobby", @"Lala", @"Tony"]];
    
    CustomView *headerView = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:nil options:nil][0];
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableVIew.frame), 200);
    self.tableVIew.tableHeaderView = headerView;
    
    UINib *customCellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableVIew registerNib:customCellNib forCellReuseIdentifier:@"CustomCell"];
    
    
//    __block NSString *myStr = @"str";
//    void (^myBlock)(void) = ^{
//        myStr = @"newStr";
//    };
//    
//    myBlock();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addItem:(UIBarButtonItem *)sender {
    [self.strings addObject:@"Nina"];
    [self.tableVIew beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.strings.count - 1 inSection:0];
    [self.tableVIew insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    [self.tableVIew endUpdates];
}

#pragma mark - TableView

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableVIew.frame), 100)];
    view.backgroundColor = [UIColor greenColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    cell.titleLabel.text = self.strings[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.strings.count;
}


@end
