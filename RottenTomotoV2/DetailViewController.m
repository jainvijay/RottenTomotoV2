//
//  DetailViewController.m
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/18/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Title %@", self.movieTitle);
        self.title = self.movieTitle;
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil backgroundImage:(UIImage *)backgroundImageOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Intitial Load %@",backgroundLoadingImage.images);

        backgroundLoadingImage = backgroundImageOrNil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.movieTitle;
    NSLog(@"Description is %@",self.movieDescription);
    self.descLabel.text = self.movieDescription;
    self.titleLabel.text = self.movieTitle;
    [self.descLabel sizeToFit];
    [self.detailImageView setImage:backgroundLoadingImage];
    NSString *original = [self.posters[@"original"] stringByReplacingOccurrencesOfString:@"_tmb" withString:@"_ori"];
    [self.detailImageView setImageWithURL:[NSURL URLWithString:original]];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.descScrollView layoutIfNeeded];
    self.descScrollView.contentSize = self.contentView.bounds.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
