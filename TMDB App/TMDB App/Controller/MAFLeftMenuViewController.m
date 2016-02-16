//
//  MAFLeftMenuViewController.m
//  TMDB App
//
//  Created by Yevhen Herasymenko on 22/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFLeftMenuViewController.h"
#import "MAFAPIManager+SearchMovieRequest.h"
#import "MAFMovie.h"
#import "MAFConstants.h"

@interface MAFLeftMenuViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) NSArray<MAFMovie *> *movies;

@end

@implementation MAFLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movies = [NSArray new];
}

#pragma mark - Action

- (IBAction)search:(UIButton *)sender {
    [self.textField resignFirstResponder];
    __weak __typeof(self) weakSelf = self;
    [[MAFAPIManager sharedManager] searchMovie:self.textField.text success:^(NSArray<MAFMovie *> *movies) {
        __strong __typeof(weakSelf) strongSelf = self;
        strongSelf.movies = movies;
        [strongSelf.tableView reloadData];
        
    }];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.movies[indexPath.row].title;
    if (indexPath.row < 2) {
        NSString *imageUrl = [MAFImageBasicUrl stringByAppendingString:self.movies[indexPath.row].posterPath];
        NSLog(@"%@", imageUrl);
        NSURL *url = [NSURL URLWithString:imageUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        cell.imageView.image = image;
    }


    return cell;
}

#pragma mark - TextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self search:nil];
    return YES;
}

@end
