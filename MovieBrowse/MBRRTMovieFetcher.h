//
//  MBRRTMovieFetcher.h
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MBRTWSearchInfo;

@interface MBRRTMovieFetcher : NSObject

-(void) fetchMovies:(NSString*)queryString success:(void(^)(NSArray *movieList))completion failure:(void(^)(NSError *error)) failure;


@end
