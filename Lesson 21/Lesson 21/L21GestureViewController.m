//
//  L21GestureViewController.m
//  Lesson 21
//
//  Created by Yevhen Herasymenko on 29/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "L21GestureViewController.h"

@interface L21GestureViewController ()

@property (weak, nonatomic) IBOutlet UIView *gestureView;

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation L21GestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
    tap.numberOfTapsRequired = 3;
    [self.gestureView addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressView)];
    
    [self.gestureView addGestureRecognizer:longPress];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeView)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    [self.gestureView addGestureRecognizer:swipe];
    
    //dispatch
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Hello");
    });
    NSLog(@"First");
    
    //timer
    
    //NSTimer *timer = [NSTimer timerWithTimeInterval:5  target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
   // [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    //[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    //[timer fire];
    
    //nsoperation
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    
    NSInvocationOperation *operationOne = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(updateFirstLabel) object:nil];
    
    NSInvocationOperation *operationTwo = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(updateSecondLabel) object:nil];
    
    operationOne.completionBlock = ^{
        NSLog(@"Finished one");
    };
    
    [operationTwo addDependency:operationOne];
    
    [queue addOperations:@[operationOne, operationTwo] waitUntilFinished:NO];
    
}

- (void)updateFirstLabel {
    
    for(int i = 0; i < 1000000; i++) {
        int randNum = rand() % 1000;
        
        NSString *num = [NSString stringWithFormat:@"%d", randNum];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.firstLabel.text = num;
        });
    }
}

- (void)updateSecondLabel {
    while(true) {
        int randNum = rand() % 3;
        
        NSString *num = [NSString stringWithFormat:@"%d", randNum];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.secondLabel.text = num;
        });
        
    }
}


- (void)timerMethod {
    NSLog(@"Timer");
}

- (void)tapView {
    NSLog(@"tapped");
}

- (void)longPressView {
    NSLog(@"longgggggg");
}

- (void)swipeView {
    NSLog(@"swipe");
}
@end
