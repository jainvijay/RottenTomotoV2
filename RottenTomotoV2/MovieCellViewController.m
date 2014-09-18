//
//  MovieCellViewController.m
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/18/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "MovieCellViewController.h"

@interface MovieCellViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *MovieImageView;
@property (weak, nonatomic) IBOutlet UIView *MovieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *MovieDescLabel;

@end

@implementation MovieCellViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
