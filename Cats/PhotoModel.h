//
//  PhotoModel.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-19.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
@import MapKit;

@interface PhotoModel : NSObject <MKAnnotation>

@property (nonatomic) UIImage *image;
@property (nonatomic) NSURL *imageURL;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *views;
@property (nonatomic) NSNumber *imageId;
@property (nonatomic) NSString *tag;
//@property (nonatomic) CLLocation *imagelocation;
@property (nonatomic) CLLocationCoordinate2D coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D )coordinate;

- (instancetype)initWithImageURL:(NSURL *)imageurl name:(NSString *)name andImageId:(NSNumber *)imageId;

@end
