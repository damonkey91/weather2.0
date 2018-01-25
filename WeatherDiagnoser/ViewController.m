//
//  ViewController.m
//  WeatherDiagnoser
//
//  Created by Christian Persson on 2018-01-25.
//  Copyright © 2018 Christian Persson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) float temperature;
@property (nonatomic) float windspeed;
@property (weak, nonatomic) IBOutlet UILabel *answer;
@property (weak, nonatomic) IBOutlet UISlider *temperatureSlider;
@property (weak, nonatomic) IBOutlet UISlider *windSpeedSlider;
@property (weak, nonatomic) IBOutlet UILabel *realTemp;
@property (weak, nonatomic) IBOutlet UILabel *realWind;
@property (nonatomic) NSString *feeling;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)generateButton:(id)sender {
    float experience = self.temperature + self.windspeed;
    self.answer.text = [self feeling:experience];
    
}
-(float)currentTemp {
    return self.temperatureSlider.value;
}
-(float)currentWind {
    return self.windSpeedSlider.value;
}
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

-(void)refresh {
    self.temperature = [self currentTemp];
    self.windspeed = [self currentWind];
    self.realTemp.text = [NSString stringWithFormat:@"%.02f C°", self.temperature ];
    self.realWind.text = [NSString stringWithFormat:@"%.02f m/s", self.windspeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)feeling:(float)experience {
    if (experience < 0) {
       self.feeling = @"Stay inside";
    } else if (experience > 0 && experience <= 10) {
        self.feeling = @"Take an extra jacket";
    } else if (experience > 10 && experience <= 20 ) {
        self.feeling = @"Awsome weather, enjoy!!!";
    } else if (experience > 20 && experience <= 35 ) {
        self.feeling = @"Bring some water";
    } else {
        self.feeling = @"It´s to hot, stay inside and drink alot of beers";
    }
    return self.feeling;
}

- (IBAction)logPressed:(id)sender {
    NSString *string = [NSString stringWithFormat:@"Temp: %.1f Windspeed: %.1f %@", self.temperature, self.windspeed, self.feeling];
    NSMutableArray *array;
    //Checks if array exists. And then adds value to array.
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"fulLog"]) {
        array = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"fulLog"]];
        
        [array addObject:string];
        
         [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"fulLog"];
    }else{
        array = @[string].mutableCopy;
        [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"fulLog"];
    }
}

@end
