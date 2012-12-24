//
//  Version.m
//  ZettaBox
//
//  Created by Polat Olu on 03/12/2012.
//
//

#import "Version.h"

@implementation Version

@synthesize major, minor, release, build;

- (id) initWithString:(NSString *)versionStr {
    self = [super init];
    
    if (self) {
        
        if (versionStr == nil)
            return nil;
        
        // Parse the vresion information
        NSArray *parts = [versionStr componentsSeparatedByString:@"."];
        
        if ([parts count] <= 0)
            return nil;
        
        major = [self getField:[parts objectAtIndex:0]];
        if (major < 0)
            return nil;

        if ([parts count] > 1) {
            minor = [self getField:[parts objectAtIndex:1]];
            if (minor < 0)
                return nil;
        }

        if ([parts count] > 2) {
            release = [self getField:[parts objectAtIndex:2]];
            if (release < 0)
                return nil;
        }

        if ([parts count] > 3) {
            build = [self getField:[parts objectAtIndex:3]];
            if (build < 0)
                return nil;
        }
    }
    
    return self;
}

- (int) getField:(NSString *)partStr {
    int result = 0;
    
    NSCharacterSet *alphaSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *cleanStr = [partStr stringByTrimmingCharactersInSet:alphaSet];
    
    // All chars removed from string
    
    if ([cleanStr isEqualToString:@""])
        return 0;
    
    result = [cleanStr integerValue];
    
    return result;
}

- (NSComparisonResult) compare:(Version *) v {
    NSComparisonResult result = NSOrderedSame;
    
    long selfVal = [self getNumericFormat];
    
    if (v == nil)
        return NSOrderedAscending;
    
    long vVal = [v getNumericFormat];
    
    if (selfVal > vVal) {
        result = NSOrderedAscending;
    }
    else if (selfVal < vVal) {
        result = NSOrderedDescending;
    }

    return result;
}

- (long) getNumericFormat {
    
    long majorVal = [self major]        * 1000000000000;
    long minorVal = [self minor]        * 1000000000;
    long releaseVal = [self release]    * 1000000;
    long buildVal = [self build]        * 1000;
    
    return majorVal + minorVal + releaseVal + buildVal;
}

@end
