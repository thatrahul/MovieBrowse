//
//  MBRMovie.h
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBRMovie : NSObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* rating;
@property (nonatomic) NSUInteger releaseYear;
@end
