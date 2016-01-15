//
//  TestTableViewController.m
//  Lesson19
//
//  Created by Yevhen Herasymenko on 15/01/2016.
//
//

#import "TestTableViewController.h"
#import "MyTableViewCell.h"

@interface TestTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *content;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 150;
    self.content = [[NSMutableArray alloc] initWithArray: @[@"Vasia", @"Petia", @"Natasha", @"Igor", @"Nina"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addName:(id)sender {
    NSString *name = @"Victor";
    
    [self.content addObject:name];
    
    [self.tableView beginUpdates];
    
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.content.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    
    [self.tableView endUpdates];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.content.count -1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

#pragma mark - TableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.firstLabel.text = self.content[indexPath.row];
    cell.secondLabel.text = [self.content[indexPath.row] stringByAppendingString:@" - Second"];
    cell.thirdLabel.text = [self.content[indexPath.row] stringByAppendingString:@" - Thifdghldfghldfghdflkgldfgldk fdjgdfl; jgklfdgj dljglkjdf gdfljg dflkjgk jfdgljd  grd"];
    
    return cell;
}

@end
