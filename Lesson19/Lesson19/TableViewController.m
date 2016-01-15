//
//  TableViewController.m
//  Lesson19
//
//  Created by Yevhen Herasymenko on 12/01/2016.
//
//

#import "TableViewController.h"

@interface TableViewController()

@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lastName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *cityLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *avatarView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    NSURLSession *session = [NSURLSession sharedSession];
    
    
//    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://superUrl"]];
//    
//    mutableRequest.HTTPMethod = @"POST";
//    NSDictionary *dict = @{@"Name" : @"Vasia", @"Sername" : @"Pupkin"};
//    NSData *httpData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//    
//    mutableRequest.HTTPBody = httpData;
//    
//    
//    NSURLSessionDataTask *postTask = [session dataTaskWithRequest:mutableRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//    }];
//    
//    [postTask resume];

    
    //url
    NSURL *url = [NSURL URLWithString:@"https://randomuser.me/api/"];
    
    //request
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                //parsing request
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf analyseDictionary:json];
                                            }];
    [dataTask resume];
}

- (void)analyseDictionary:(NSDictionary *)dict {
    NSArray *results = dict[@"results"];
    NSDictionary *resultDict = results[0];

    NSString *imageURL = resultDict[@"user"][@"picture"][@"medium"];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.firstName.text = resultDict[@"user"][@"name"][@"first"];
        self.lastName.text = resultDict[@"user"][@"name"][@"last"];
        self.cityLabel.text = resultDict[@"user"][@"location"][@"city"];
        self.avatarView.image = [UIImage imageWithData:imageData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
