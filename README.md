# version-ios

Helps to parse up to 4 field version numbers and compare them.

## Features
 * Supports up to 4 version fields (major.minor.build.release)
 * Each field is optional.
 * Version object is comparable with other version objects
 * Simple to use
 * 

## Sample Usage

```objective-c
// Init Version object.
Version version1 = [[Version alloc] initWithString@"1.5.0.0"];
Version version2 = [[Version alloc] initWithString@"1.5.0.1"];

// Compare version objects
NSComparisonResult result = [version1 compare:version2];

````


## Warnings

 * Assumes max 3 digits for every version field. Some 'release' numbers may be more than 4 digits, these kind of fields will be trimmed.
 * Removes every character from the version number before parsing. So versions like 1.0.5b, 1.2c, etc may not work as expected.
