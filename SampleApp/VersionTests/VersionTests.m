//
//  VersionTests.m
//  Version-ios
//
//  Created by Polat Olu on 03/12/2012.
//
//

#import "VersionTests.h"

@implementation VersionTests

- (void) testVersionParserWithCorrectFormatReturnsCorrectVersion
{
    // Arrange
    NSString *testVersion = @"1.1.5.1";
    
    // Act
    Version *v = [[Version alloc] initWithString:testVersion];
    
    // Assert
    STAssertNotNil(v, @"v variable should not be nil");
    STAssertTrue([v major] == 1, @"Major field should be 1");
    STAssertTrue([v minor] == 1, @"Minor field should be 1");
    STAssertTrue([v release] == 5, @"Release field should be 5");
    STAssertTrue([v build] == 1, @"Build field should be 1");
}


- (void) testVersionParserWithNilFormatReturnsNil
{
    // Arrange
    NSString *testVersion = nil;
    
    // Act
    Version *v = [[Version alloc] initWithString:testVersion];
    
    // Assert
    STAssertNil(v, @"v variable should be nil");
}

- (void) testVersionParserWithIncorrectFormat
{
    // Arrange
    NSString *testVersion1 = @"this is a test";
    NSString *testVersion2 = @"this.is.a.test";
    NSString *testVersion3 = @"1.0.6."; // Ending dot should not parsed
    
    // Act
    Version *v1 = [[Version alloc] initWithString:testVersion1];
    Version *v2 = [[Version alloc] initWithString:testVersion2];
    Version *v3 = [[Version alloc] initWithString:testVersion3];
    
    // Assert
    STAssertNotNil(v1, @"v1 variable should not be nil");
    STAssertNotNil(v2, @"v2 variable should not be nil");
    STAssertNotNil(v3, @"v3 variable should not be nil");
    
    STAssertTrue([v3 major] == 1, @"v3.Major must be 1");
    STAssertTrue([v3 minor] == 0, @"v3.Minor must be 0");
    STAssertTrue([v3 release] == 6, @"v3.Release must be 6");
    STAssertTrue([v3 build] == 0, @"v3.Build must be 0");
    
}

- (void) testVersionParserWithCorrectFormatWithTextRemovesTexts
{
    // Arrange
    NSString *testVersion1 = @"1this.0is.a0.test0";
    NSString *testVersion2 = @"1.0.5.drop8";
    
    // Act
    Version *v1 = [[Version alloc] initWithString:testVersion1];
    Version *v2 = [[Version alloc] initWithString:testVersion2];
    
    // Assert

    STAssertNotNil(v1, @"v1 variable should not be nil");
    STAssertTrue([v1 major] == 1, @"v1.Major field should be 1");
    STAssertTrue([v1 minor] == 0, @"v1.Minor field should be 0");
    STAssertTrue([v1 release] == 0, @"v1.Release field should be 0");
    STAssertTrue([v1 build] == 0, @"v1.Build field should be 0");

    STAssertNotNil(v2, @"v1 variable should not be nil");
    STAssertTrue([v2 major] == 1, @"v1.Major field should be 1");
    STAssertTrue([v2 minor] == 0, @"v1.Minor field should be 0");
    STAssertTrue([v2 release] == 5, @"v1.Release field should be 5");
    STAssertTrue([v2 build] == 8, @"v1.Build field should be 8");
}

- (void) testCompareVersions
{
    // Arrange
    NSString *testBiggestVersion = @"3.0.4.1";
    NSString *testSmallestVersion = @"2.1.5.6";
    NSString *testEqual1 = @"2.0.4.5";
    NSString *testEqual2 = @"2.0.4.5";
    
    // Act
    Version *vBiggest = [[Version alloc] initWithString:testBiggestVersion];
    Version *vSmallest = [[Version alloc] initWithString:testSmallestVersion];
    Version *vEqual1 = [[Version alloc] initWithString:testEqual1];
    Version *vEqual2 = [[Version alloc] initWithString:testEqual2];
    
    // Assert
    STAssertTrue([vBiggest compare:vSmallest] == NSOrderedAscending, @"Result should be Ascending");
    STAssertTrue([vSmallest compare:vBiggest] == NSOrderedDescending, @"Result should be Descending");
    STAssertTrue([vEqual1 compare:vEqual2] == NSOrderedSame, @"Result should be Same");
    STAssertTrue([vBiggest compare:nil] == NSOrderedAscending, @"Result should be Ascending");
}


- (void) testShortFormats
{
    // Arrange
    NSString *test4Digits = @"3.0.4.1";
    NSString *test3Digits = @"2.1.5";
    NSString *test2Digits = @"2.1";
    NSString *test1Digit = @"2";
    
    // Act
    Version *v4 = [[Version alloc] initWithString:test4Digits];
    Version *v3 = [[Version alloc] initWithString:test3Digits];
    Version *v2 = [[Version alloc] initWithString:test2Digits];
    Version *v1 = [[Version alloc] initWithString:test1Digit];
    
    // Assert
    STAssertNotNil(v4, @"v4 should not be nil");
    STAssertNotNil(v3, @"v3 should not be nil");
    STAssertNotNil(v2, @"v2 should not be nil");
    STAssertNotNil(v1, @"v1 should not be nil");
    
    // v4
    STAssertTrue([v4 major] == 3, @"v4.Major field should be 3");
    STAssertTrue([v4 minor] == 0, @"v4.Minor field should be 0");
    STAssertTrue([v4 release] == 4, @"v4.Release field should be 4");
    STAssertTrue([v4 build] == 1, @"v4.Build field should be 1");

    // v3
    STAssertTrue([v3 major] == 2, @"v3.Major field should be 2");
    STAssertTrue([v3 minor] == 1, @"v3.Minor field should be 1");
    STAssertTrue([v3 release] == 5, @"v3.Release field should be 5");
    STAssertTrue([v3 build] == 0, @"v3.Build field should be 0");
    
    // v2
    STAssertTrue([v2 major] == 2, @"v2.Major field should be 2");
    STAssertTrue([v2 minor] == 1, @"v2.Minor field should be 1");
    STAssertTrue([v2 release] == 0, @"v2.Release field should be 0");
    STAssertTrue([v2 build] == 0, @"v2.Build field should be 0");
    
    // v1
    STAssertTrue([v1 major] == 2, @"v1.Major field should be 2");
    STAssertTrue([v1 minor] == 0, @"v1.Minor field should be 0");
    STAssertTrue([v1 release] == 0, @"v1.Release field should be 0");
    STAssertTrue([v1 build] == 0, @"v1.Build field should be 0");
}

@end
