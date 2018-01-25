//
//  WeatherLog.m
//  WeatherDiagnoser
//
//  Created by Robin kamo on 2018-01-25.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "WeatherLog.h"
#import "ViewController.h"

@interface WeatherLog ()
@property (nonatomic) float windspeed;
@property (nonatomic) float temp;
@property (nonatomic) NSString* feeling;
@property (nonatomic) NSArray *logsOfWeather;
@property (nonatomic) NSString *dailylog;


@end

@implementation WeatherLog

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    self.windspeed = [[NSUserDefaults standardUserDefaults]floatForKey:@"windSpeed"];
    self.temp = [[NSUserDefaults standardUserDefaults]floatForKey:@"temp"];
    self.feeling = [[NSUserDefaults standardUserDefaults]objectForKey:@"feeling"];
    self.dailylog =[NSString stringWithFormat:@"Temp: %.1f Windspeed: %.1f %@", self.temp, self.windspeed, self.feeling];
    [self.logsOfWeather addObject:self.dailylog];
    
    */
    self.logsOfWeather = [[NSUserDefaults standardUserDefaults]objectForKey:@"fulLog"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.logsOfWeather.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherAdapter" forIndexPath:indexPath];
    
        cell.textLabel.text = self.logsOfWeather[indexPath.row];
    
    
    
    return cell;
}

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
