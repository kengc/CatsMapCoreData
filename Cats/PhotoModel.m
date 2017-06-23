//
//  PhotoModel.m
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-19.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "PhotoModel.h"


@implementation PhotoModel

- (instancetype)initWithImageURL:(NSURL *)imageurl name:(NSString *)name andImageId:(NSNumber *)imageId
{
    self = [super init];
    if (self) {
        _imageURL = imageurl;
        _name = name;
        _imageId = imageId;
    }
    return self;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D )coordinate;
{
    self = [super init];
    if (self) {
        _coordinate = coordinate;
    }
    return self;
}

@end
