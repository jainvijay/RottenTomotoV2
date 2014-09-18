//
//  MovieTableViewCell.h
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/18/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *MovieImageView;
@property (weak, nonatomic) IBOutlet UILabel *MovieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *MovieDescLabel;
- (UIImage *)getCurrentThumbnailImage;
@end
