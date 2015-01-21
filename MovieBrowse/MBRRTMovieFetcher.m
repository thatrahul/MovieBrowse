//
//  MBRRTMovieFetcher.m
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "MBRRTMovieFetcher.h"
#import "MBRMovie.h"
#import <AFNetworking.h>

@implementation MBRRTMovieFetcher

NSString* const RT_MOVIE_SEARCH_BASE_URL = @"http://api.rottentomatoes.com/api/public/v1.0/movies.json";
NSString* const RT_API_KEY=@"9tzghdhw4rktwpvqnq67e9nx";


-(void)fetchMovies:(NSString *)queryString success:(void (^)(NSArray *))completion failure:(void (^)(NSError *))failure
{
    NSMutableString* urlBuilder = [[NSMutableString alloc] init];
    [urlBuilder appendString:RT_MOVIE_SEARCH_BASE_URL];
    [urlBuilder appendString:@"?"];
    [urlBuilder appendString:@"apikey="];
    [urlBuilder appendString:RT_API_KEY];
    [urlBuilder appendString:@"&page_limit=30"];
    [urlBuilder appendString:@"&q="];
    [urlBuilder appendString:[queryString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURL* rtURL = [NSURL URLWithString:urlBuilder];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:rtURL];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        NSDictionary* listing = (NSDictionary *)responseObject;
        NSArray* allmovies = [listing valueForKey:@"movies"];
        
        NSArray* parsedMovies = [MTLJSONAdapter modelsOfClass:MBRMovie.class fromJSONArray:allmovies error:NULL];
        completion(parsedMovies);
        NSLog(@"Got the listing");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bad thing happened"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}

@end
