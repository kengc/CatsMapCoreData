//
//  SearchViewController.m
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-20.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    //self.locationManager.allowsBackgroundLocationUpdates = YES;
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)setDetailItem:(PhotoModel *)newDetailItem {
    //if (self.detailItem != newDetailItem) {
    _photoObject = newDetailItem;
    
}


- (IBAction)SaveAction:(UIButton *)sender {

    if(self.swtichControll.on){
       [self.delegate setNewSearchTag:self.searchTagText.text andlocation:self.currentLocation];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
       [self.delegate setNewSearchTag:self.searchTagText.text];
       [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


- (IBAction)swichAction:(UISwitch *)sender {
    if(self.swtichControll.enabled == YES){
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
            [self.locationManager requestLocation];
        } else {
            // Send the user to settings to enable location authorization
        }
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"kCLAuthorizationStatusAuthorizedWhenInUse");
    } else if (status == kCLAuthorizationStatusAuthorizedAlways) {
        NSLog(@"kCLAuthorizationStatusAuthorizedAlways");
    } else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"kCLAuthorizationStatusDenied");
    }
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    if (!self.currentLocation) {
        self.currentLocation = locations[0];
        
        NSLog(@"location: %@", locations[0]);
        
        //[self performSegueWithIdentifier:@"show-map" sender:self];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error getting the location updates: %@", error.localizedDescription);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
