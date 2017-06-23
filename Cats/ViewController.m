//
//  ViewController.m
//  Cats
//
//  Created by Kevin Cleathero on 2017-06-19.
//  Copyright © 2017 Kevin Cleathero. All rights reserved.
//

#import "ViewController.h"
#import "PhotoModel.h"
#import "CustomImageCell.h"
#import "DetailsViewController.h"
#import "MapViewController.h"
#import "NSURLSessionModel.h"





@interface ViewController ()

@property (nonatomic) NSMutableArray *photos;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSIndexPath *indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.photos = [[NSMutableArray alloc] init];
    
    //NSString *defaultTag = @"cat";
    //[NSURLSessionModel setNSURLSessionTag:self.photos tag:defaultTag andCollectionView:self.collectionView];
    [self performSegueWithIdentifier: @"searchSegue" sender: self];
}



#pragma Mark - collectionView DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return self.photos.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}


#pragma Mark - collectionView Delegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    //need to pass some data
    
    PhotoModel *photoObject = self.photos[indexPath.row];
    
    //Add a UIImage property to the Photo object to store the image once it's downloaded. Use this property to check if the image has already been downloaded and use it if it has.
    
    //cell.delegate = self;
    
    if(photoObject.image == nil){
        NSData *data = [NSData dataWithContentsOfURL:photoObject.imageURL];
        UIImage *result = [UIImage imageWithData:data];
        cell.imageViewCell.image = result;
        photoObject.image = result;
        cell.imageViewLabel.text = photoObject.name;
    } else{
        cell.imageViewCell.image = photoObject.image;
        cell.imageViewLabel.text = photoObject.name;
    }

    

    //cell.imgSmallabel.text = imageObject.imgDescription;
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [self performSegueWithIdentifier:@"segue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"segue"]){
        PhotoModel *photoObject = [self.photos objectAtIndex:self.indexPath.row];
        DetailsViewController *controller = [segue destinationViewController];
        [controller setDetailItem:photoObject];
    }
    if([segue.identifier isEqualToString:@"mapSegue"]){
        PhotoModel *photoObject = [self.photos objectAtIndex:self.indexPath.row];
        MapViewController *controller = [segue destinationViewController];
        [controller setDetailItem:photoObject];
    }
    
    if([segue.identifier isEqualToString:@"searchSegue"]){
        //PhotoModel *photoObject = [self.photos objectAtIndex:self.indexPath.row];
        SearchViewController *controller = [segue destinationViewController];
        controller.delegate = self;
        //[controller setDetailItem:photoObject];
    }
}

#pragma Mark - Map button Navigation
- (IBAction)mapAction:(UIButton *)sender {
      [self performSegueWithIdentifier: @"mapSegue" sender: self];
}


//-(void)collectionCellDidTap:(CustomImageCell *)cell{
//    self.indexPath = [self.collectionView indexPathForCell:cell];
//    [self performSegueWithIdentifier:@"segue" sender:self];
//}

- (IBAction)searchAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier: @"searchSegue" sender: self];
}

-(void)setNewSearchTag:(NSString *)tag{
    [NSURLSessionModel setNSURLSessionTag:self.photos tag:tag andCollectionView:self.collectionView];
}

-(void)setNewSearchTag:(NSString *)tag andlocation:(CLLocation *)location{
    [NSURLSessionModel setNSURLSessionTag:self.photos tag:tag location:location andCollectionView:self.collectionView];
}

@end
