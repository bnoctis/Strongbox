//
//  ZlibStreamTests.m
//  StrongboxTests
//
//  Created by Mark on 07/09/2019.
//  Copyright © 2019 Mark McGuill. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CommonTesting.h"
#import "GZipInputStream.h"

@interface ZlibStreamTests : XCTestCase

@end

@implementation ZlibStreamTests

- (void)testLargeBuffer {
    NSData *largeDb = [CommonTesting getDataFromBundleFile:@"large-zlib" ofType:@"zlib"];
    XCTAssertNotNil(largeDb);
    
    GZipInputStream *stream = [[GZipInputStream alloc] initWithData:largeDb];
    
    [stream open];
    
    const NSUInteger kSize = 8096;
    uint8_t buf[kSize];
    
    NSInteger bytesRead;
    NSInteger totalRead;

    while((bytesRead = [stream read:buf maxLength:kSize]) != 0) {
        totalRead += bytesRead;
        //NSLog(@"Read: %ld", (long)bytesRead);
    }
    
    [stream close];
    
    XCTAssertEqual(totalRead, 73853434);
}

@end