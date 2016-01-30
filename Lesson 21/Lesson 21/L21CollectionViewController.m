//
//  L21CollectionViewController.m
//  Lesson 21
//
//  Created by Yevhen Herasymenko on 29/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "L21CollectionViewController.h"
#import "L21CollectionViewCell.h"

@interface L21CollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray<NSString *> * strings;

@end

@implementation L21CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.strings = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.strings.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    L21CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.label.text = self.strings[indexPath.row];
    
    return cell;
}

@end
