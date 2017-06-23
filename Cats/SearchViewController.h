//
//  SearchViewController.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-20.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"
@import CoreLocation;

@protocol SearchViewControllerProtocol <NSObject>

-(void)setNewSearchTag:(NSString *)tag;
-(void)setNewSearchTag:(NSString *)tag andlocation:(CLLocation *)location;

@end

@interface SearchViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) id<SearchViewControllerProtocol> delegate;

@property (strong, nonatomic) IBOutlet UISwitch *swtichControll;

@property (strong, nonatomic) IBOutlet UITextField *searchTagText;

@property (strong, nonatomic) PhotoModel *photoObject;

- (void)setDetailItem:(PhotoModel *)newDetailItem;

@end
