//
//  ViewController.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 05/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "ViewController.h"

static NSString *const BasicUrl = @"http://api.openweathermap.org";
static NSString *const WeatherCityNameUrl = @"/data/2.5/weather?q=%@,uk&appid=2de143494c0b295cca9337e1e96b00e0&mine=true";

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *temperatureBackground;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.temperatureBackground.layer.masksToBounds = YES;
    self.temperatureBackground.layer.cornerRadius = CGRectGetWidth(self.temperatureBackground.frame)/2;
}

- (void)configurationScreenWithDictionary:(NSDictionary *)weatherDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *nameCity = weatherDictionary[@"name"];
        self.cityNameLabel.text = nameCity;
        NSDictionary *mainDictionary = weatherDictionary[@"main"];
        NSString *temperatureString = mainDictionary[@"temp"];
        NSInteger temp = [temperatureString integerValue];
        self.temperatureLabel.text = [@(temp - 273) description];
    });

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    __weak typeof(self) weakSelf = self;
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *urlString = [BasicUrl stringByAppendingString:WeatherCityNameUrl];
    urlString = [NSString stringWithFormat:urlString, textField.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf configurationScreenWithDictionary:json];
                                            }];
    [dataTask resume];
    return YES;
}

@end
