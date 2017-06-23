//
//  DetailsViewController.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-19.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageViewDetail;
@property (strong, nonatomic) IBOutlet UILabel *imageNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfViewDetail;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;

@property (strong, nonatomic) PhotoModel *photoObject;

- (void)configureView;
- (void)setDetailItem:(PhotoModel *)newDetailItem;

@end
