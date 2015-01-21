//
//  MBRMovie.h
//  MovieBrowse
//
//  Created by Rahul Phadnis on 1/19/15.
//  Copyright (c) 2015 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@class MTLModel;

@interface MBRMovie : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* rating;
@property (nonatomic) NSUInteger releaseYear;
@end
