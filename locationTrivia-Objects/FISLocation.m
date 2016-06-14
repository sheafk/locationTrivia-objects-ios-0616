//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Shea Furey-King on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"


@implementation FISLocation

-(instancetype) init {
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}

-(instancetype)initWithName: (NSString *)name
                   latitude: (CGFloat)latitude
                  longitude: (CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc]init];
    }
    return self;
    
}


-(NSString *)stringByTruncatingNameToLength: (NSUInteger)length {

    if ([self.name length] < length) {
        return self.name;
    }
    
    else {
        NSString *shortenedName = [self.name substringToIndex:length];

    return shortenedName;
    }
}

-(BOOL)hasValidData {
    
    if ([self.name isEqualToString:@""]) {
        return NO;
    }
    
    if (self.name == nil) {
        return NO;
    }
    
    if (self.latitude < (-90.0)) {
        return NO;
    }
    
    if (self.latitude > (90.0)) {
        return NO;
    }
    
    if (self.longitude <= (-180.0)) {
        return NO;
    }
    
    if (self.longitude > (180.0)) {
        return NO;
    }
    
    else {
        return YES;
    }
}


-(FISTrivium *)triviumWithMostLikes {
    
    if ([self.trivia count] == 0) {
        return nil;
    }
    
    else {
        NSSortDescriptor *sortedByLikes = [[NSSortDescriptor alloc]initWithKey:@"likes" ascending:YES];
        
        NSArray *sortedArrayByLikes = [NSArray arrayWithObject:sortedByLikes];
        NSArray *sortedTriviaByLikes = [self.trivia sortedArrayUsingDescriptors:sortedArrayByLikes];
        
        FISTrivium *mostLiked = [sortedTriviaByLikes lastObject];
        return mostLiked;
    }
    
}

@end
