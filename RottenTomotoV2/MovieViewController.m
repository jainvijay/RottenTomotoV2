//
//  MovieViewController.m
//  RottenTomotoV2
//
//  Created by Vijay Jain on 9/17/14.
//  Copyright (c) 2014 Vijay Jain. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailViewController.h"
#import "AFNetworking.h"


@interface MovieViewController () {
    NSArray *movies;
}
- (void)fetchData:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Rotten Tomoto";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(fetchData:) forControlEvents:UIControlEventValueChanged];
    [self fetchData:nil];
    
    self.tableView.rowHeight = 175;
    self.tableView.dataSource = self;
    UINib *movieCellNib = [UINib nibWithNibName:@"MovieTableViewCell" bundle:nil];
    [self.tableView registerNib:movieCellNib forCellReuseIdentifier:@"MovieCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    // XXX return the height here instead of setting a static height in viewDidLoad
    cell.MovieTitleLabel.text = movies[indexPath.row][@"title"];
    cell.MovieDescLabel.text = movies[indexPath.row][@"synopsis"];
    NSString *thumbnail = movies[indexPath.row][@"posters"][@"thumbnail"];
    NSLog(@"Movie is %@",thumbnail);

    [cell.MovieImageView setImageWithURL:[NSURL URLWithString:thumbnail]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    //Value Selected by user
    NSDictionary *movie = [movies objectAtIndex:indexPath.row];
    
    //Initialize new viewController
    NSLog(@"New Style movie %@",movie[@"posters"][@"detailed"]);


    UIImage *setImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:movie[@"posters"][@"detailed"]]]];
    //UIImage *setImg=[ UIImage imageNamed:movie[@"posters"][@"detailed"]];

    NSLog(@"Before living %@",setImg);

    DetailViewController *dvc = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil backgroundImage:setImg];

    dvc.movieTitle = movies[indexPath.row][@"title"];
    dvc.movieDescription = movies[indexPath.row][@"synopsis"];
    dvc.posters = movies[indexPath.row][@"posters"];
                   
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void) fetchData:(id)sender {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us";
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL
                                                 URLWithString:url]];
    

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //self.movies = object[@"movies"];
        movies = object[@"movies"];
        
        [self.tableView reloadData];
     //   [self.collectionRefreshControl endRefreshing];
        
    }];
    
}

@end
