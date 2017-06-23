//
//  CustomImageCell.h
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-19.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomImageCell;

//@protocol CustomImageCellProtocol <NSObject>
//
//-(void)collectionCellDidTap:(CustomImageCell *)cell;
//
//@end

@interface CustomImageCell : UICollectionViewCell

//@property (weak, nonatomic) id<CustomImageCellProtocol> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *imageViewCell;

@property (strong, nonatomic) IBOutlet UILabel *imageViewLabel;


@end
