//
//  DataTest.m
//  Commons-iOS
//
//  Created by Daniel Zhang (張道博) on 2/16/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "CommonsApp.h"

@interface DataTest : GHTestCase

@property (nonatomic, strong) CommonsApp *app;

@end

@implementation DataTest

-(void)setUp
{
    self.app = [CommonsApp singleton];

    // no user account case
    self.app.username = @"";
    self.app.password = @"";
    [self.app saveCredentials];
}

/**
 * Test initialization of Core Data.
 */
-(void)testDataSetup
{
    [self.app initializeApp];
    GHAssertEquals([self.app.context class],[NSManagedObjectContext class], @"Context is created.");
}

@end
