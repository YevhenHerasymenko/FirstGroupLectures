//
//  MyTableViewController.m
//  PracticQuestions
//
//  Created by Yevhen Herasymenko on 12/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"

@interface MyTableViewController ()

@property (copy, nonatomic) NSArray<NSString *> *cellTexts;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.cellTexts = @[@"Text dsfsdfsdfgsdfg sdljfgsdkl jsdfjk slkdjfsldk; jfsd fjsd lfjskdj flksdjf klsdjflks djfkl sdjf lkjsdkljfldsjflksdjf ;lsdjfkl;jsdl; fkjdsl;k jf", @"dsfjsdlfhsdlk jlksdjf sdfjkl sdlkfjsdlfjsd"];
    self.tableView.estimatedRowHeight = 150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTexts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.cellTexts[indexPath.row]];
    
    [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(10, 10)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(15, 20)];
    
    cell.label.attributedText = str;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*CGSize maximumLabelSize = CGSizeMake(CGRectGetWidth(self.view.frame), FLT_MAX);
    
    UIFont *font = [UIFont systemFontOfSize:17];
    
    CGRect expectedLabelSize = [self.cellTexts[indexPath.row] boundingRectWithSize:maximumLabelSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : font} context:nil];

    return expectedLabelSize.size.height*1.5 + 6;*/
    return  UITableViewAutomaticDimension;
}

@end
