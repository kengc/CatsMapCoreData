//
//  NSURLSession.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-20.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface NSURLSessionModel : NSObject

+(void)setNSURLSessionTag:(NSMutableArray *)photoArray tag:(NSString *)tag andCollectionView:(UICollectionView *)collectionView;

+(void)setNSURLSessionTag:(NSMutableArray *)photoArray tag:(NSString *)tag location:(CLLocation *)location andCollectionView:(UICollectionView *)collectionView;

@end
