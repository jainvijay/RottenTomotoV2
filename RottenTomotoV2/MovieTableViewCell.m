//
//  MovieTableViewCell.m
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/18/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImage *)getCurrentThumbnailImage{
    return self.MovieImageView.image;
}

@end
