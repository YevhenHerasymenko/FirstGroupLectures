//
//  WriteViewController.m
//  Lesson 25
//
//  Created by Yevhen Herasymenko on 05/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"testFile.txt"];
    
    //NSError * error = NULL;
    
    NSDictionary *dict = @{@"key" : self.textField.text};
    
    BOOL success = [dict writeToFile:filePath atomically:YES];
    if (!success) {
        NSLog(@"error writing");
    }
    
    
//    BOOL success = [self.textField.text writeToFile:filePath atomically:NO encoding:NSUTF8StringEncoding error:&error];
//    if(success == NO)
//    {
//        NSLog( @"error saving - %@", [error localizedDescription] );
//    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
