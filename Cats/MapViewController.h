//
//  MapViewController.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-20.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"

@interface MapViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) PhotoModel *photoObject;

- (void)configureView;
- (void)setDetailItem:(PhotoModel *)newDetailItem;

@end
