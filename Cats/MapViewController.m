//
//  MapViewController.m
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-20.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Update the view. TWICE to be safe
    [self configureView];
    [self fetchAdditionalImageInfo];
    
    self.mapView.delegate =self;
    
}

- (void)setDetailItem:(PhotoModel *)newDetailItem {
    //if (self.detailItem != newDetailItem) {
    _photoObject = newDetailItem;
    
    // Update the view. TWICE to be safe
    [self configureView];
    [self fetchAdditionalImageInfo];
    
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.photoObject) {
        
        //[self.imageViewDetail setImage:self.photoObject.image];
   
        
        //self.imageNameLabel.text = self.photoObject.name;

    }
}

-(void)fetchAdditionalImageInfo{
    
    //PhotoModel *photoObject = [self.photos objectAtIndex:self.indexPath.row];
    NSNumber *imageId = self.photoObject.imageId;
    
    NSString *photoDetailURL = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&photo_id=%@&format=json&nojsoncallback=1&api_key=28602178605addc1a7730e3c90733b22&tags=cat", imageId];
    
    
    NSURL *url = [NSURL URLWithString:photoDetailURL];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *flickr = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        //have to dig two levels deep photos is just one level, must go to "photo" to get the actual images
        //NSNumber *views = flickr[@"photo"][@"views"];
        
        //NSDictionary *location = flickr[@"photo"][@"location"];
        NSNumber *lat = flickr[@"photo"][@"location"][@"latitude"];
        NSNumber *log = flickr[@"photo"][@"location"][@"longitude"];
        
        NSLog(@"lat %@", lat);
        NSLog(@"long %@", log);
        
    
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.photoObject.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [log doubleValue]);
            
            MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
            self.mapView.region = MKCoordinateRegionMake(self.photoObject.coordinate, span);
            
            PhotoModel *annotation = [[PhotoModel alloc] initWithCoordinate:self.photoObject.coordinate];
            
            [self.mapView addAnnotation:annotation];
            
        });
        
    }];
    [dataTask resume];
    
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
