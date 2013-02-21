//
//  MWApiTest.m
//  Commons-iOS
//
//  Created by Daniel Zhang (張道博) on 2/19/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "MWApi+Testing.h"

@interface MWApiTest : GHTestCase

@property(nonatomic, strong) NSURL *url;
@property(nonatomic, strong) MWApi *api;

@end


@implementation MWApiTest

/**
 * Setup unit test.
 */
- (void)setUp
{
    NSString *wikiURLBase = @"https://test.wikipedia.org";
    self.url = [NSURL URLWithString:[wikiURLBase stringByAppendingString:@"/w/api.php"]];
    self.api = [[MWApi alloc] initWithApiUrl:self.url];
}

/**
 * Test logging out.
 */
//-(void)testLogout
//{
//    [self.api setIsLoggedIn:YES];
//    [self.api logout];
//    NSLog(@"%@", self.api.isLoggedIn);
//    GHAssertFalse(self.api.isLoggedIn, @"Is logged in is FALSE.");
//}

@end
