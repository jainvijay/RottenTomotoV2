//
//  DetailViewController.h
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/18/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
UIImage *backgroundLoadingImage;
}

@property (weak, nonatomic) NSString *movieTitle;
@property (weak, nonatomic) NSString *movieDescription;
@property (weak, nonatomic) NSDictionary *posters;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *descScrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil backgroundImage:(UIImage *)backgroundImageOrNil;

@end
