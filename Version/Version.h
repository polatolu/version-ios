//
//  Version.h
//  ZettaBox
//
//  Created by Polat Olu on 03/12/2012.
//
//

#import <Foundation/Foundation.h>

// Represents a version information and helps comparing versions
@interface Version : NSObject

- (id) initWithString:(NSString *)versionStr;

@property (nonatomic, assign) int major;
@property (nonatomic, assign) int minor;
@property (nonatomic, assign) int release;
@property (nonatomic, assign) int build;

- (int) getField:(NSString *)partStr;

// Compares current instance and parameter version classes
- (NSComparisonResult) compare:(Version *) v;

// Returns the numeric representation of version
- (long long) getNumericFormat;
@end
