//
//  FGPFacebookViewController.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 18/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "FGPFacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "FGPMovie.h"

@interface FGPFacebookViewController ()

@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@end

@implementation FGPFacebookViewController

static NSString *const BasicUrl = @"http://api.themoviedb.org/";
static NSString *const SearchUrl = @"3/search/person?api_key=4a4458ca87249eb4585b24deecb41376&query=Flash";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.facebookButton.layer.masksToBounds = YES;
    self.facebookButton.layer.cornerRadius = CGRectGetHeight(self.facebookButton.frame)/5;
}

- (IBAction)loginWithFacebook:(UIButton *)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

- (IBAction)getMovies:(UIButton *)sender {
    __weak typeof(self) weakSelf = self;
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //url
    NSString *urlString = [BasicUrl stringByAppendingString:SearchUrl];
    NSURL *url = [NSURL URLWithString:urlString];
    
    //request
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                //parsing request
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf configurationScreenWithDictionary:json];
                                            }];
    [dataTask resume];
}

- (void)configurationScreenWithDictionary:(NSDictionary *)dictionary {
    NSArray *results = [dictionary valueForKey:@"results"];
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *movieDictionary in results) {
        FGPMovie *movie = [[FGPMovie alloc] initWithDictionary:movieDictionary];
        [movies addObject:movie];
    }
    
    NSLog(@"%@", movies);
    
}


@end
