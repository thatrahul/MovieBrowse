//
//  MBRMovieListTWC.m
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "MBRMovieListTWC.h"
#import "MBRRTMovieFetcher.h"
#import "MBRMovie.h"

@interface MBRMovieListTWC ()

@end

@implementation MBRMovieListTWC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchMovies];
    //self.movies = movies;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setMovies:(NSArray *)movies {
    _movies = movies;
    [self.tableView reloadData];
}

-(void) fetchMovies {
    MBRRTMovieFetcher *fetcher = [[MBRRTMovieFetcher alloc] init];
    dispatch_queue_t fetchq = dispatch_queue_create("moviefetch", NULL);
    dispatch_async(fetchq, ^{
        [fetcher fetchMovies:@"thomas" success:^(NSArray* movieList){
            dispatch_async(dispatch_get_main_queue(),^ {
                self.movies = movieList;
            });
            
        } failure:^(NSError *error) {
            NSLog(@"Something really bad happened");
            
        }] ;
    });
}


#pragma mark - UI Table View Controller properties

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    id obj = self.movies[indexPath.row];
    
    MBRMovie *movie = (MBRMovie*) obj;
    cell.textLabel.text = movie.title;
    cell.detailTextLabel.text = movie.rating;
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Movie List";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
