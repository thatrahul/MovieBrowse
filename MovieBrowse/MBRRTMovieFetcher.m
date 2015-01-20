//
//  MBRRTMovieFetcher.m
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import "MBRRTMovieFetcher.h"
#import "MBRMovie.h"

@implementation MBRRTMovieFetcher

-(NSArray*) fetchMovies {
    
    NSMutableArray* movies = [[NSMutableArray alloc] initWithCapacity:10];
    {
        MBRMovie* m1 = [[MBRMovie alloc] init];
        m1.title = @"Toy story";
        m1.rating = @"G";
        m1.releaseYear = 2000;
        
        [movies addObject:m1];

    }
    {
        MBRMovie* m1 = [[MBRMovie alloc] init];
        m1.title = @"Sound of music";
        m1.rating = @"G";
        m1.releaseYear = 1950;
        
        [movies addObject:m1];
        
    }
    {
        MBRMovie* m1 = [[MBRMovie alloc] init];
        m1.title = @"Argo";
        m1.rating = @"R";
        m1.releaseYear = 1914;
        
        [movies addObject:m1];
        
    }
    
    return [[NSArray alloc] initWithArray:movies];
}

@end
