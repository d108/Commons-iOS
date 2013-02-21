//
//  LoginTest.m
//  Commons-iOS
//
//  Created by Daniel Zhang (張道博) on 2/13/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "MWApi.h"
#import "CommonsApp.h"
#import "MWApi+Testing.h"

@interface LoginTest : GHAsyncTestCase

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) MWApi *api;
@property (nonatomic, strong) CommonsApp *app;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@end

@implementation LoginTest

- (BOOL)shouldRunOnMainThread
{
    return NO;
}

- (void)setUp
{
    NSString *wikiURLBase = @"https://test.wikipedia.org";
    self.url = [NSURL URLWithString:[wikiURLBase stringByAppendingString:@"/w/api.php"]];
    self.api = [[MWApi alloc] initWithApiUrl:self.url];
    self.app = [CommonsApp singleton];

    [self.app initializeApp];

    self.username = @"BadUsername";
    self.password = @"BadPassword";
}

/**
 * Test credential saving.
 */
-(void)testSaveCredentials
{
    self.app.username = self.username;
    self.app.password = self.password;
    [self.app saveCredentials];
    [self.app loadCredentials];
    GHAssertEqualStrings(self.username, self.app.username, @"App username is saved.");
    GHAssertEqualStrings(self.password, self.app.password, @"App password is saved.");
}

/**
 * Test the login process. Use invalid credentials for now.
 */
- (void)testLogin
{
    [self prepare];

    MWPromise *login = [self.api loginWithUsername:self.username
                                       andPassword:self.password];

    [login done:^(NSDictionary *loginResult) {

        NSLog(@"login: %@", loginResult[@"login"][@"result"]);

        if (self.api.isLoggedIn) {
            [self notify:kGHUnitWaitStatusFailure forSelector:_cmd];
        } else {
            // Credentials invalid
            NSLog(@"Credentials invalid!");
            [self notify:kGHUnitWaitStatusSuccess forSelector:_cmd];
        }
    }];

    [login fail:^(NSError *error) {
        NSLog(@"Login failed: %@", [error localizedDescription]);
        [self notify:kGHUnitWaitStatusFailure forSelector:_cmd];
    }];

    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:15.0];
}

/**
 * Test logging out.
 * @todo make into a real test of logging out, but first need to be logged in.
 */
-(void)testLogout
{
    [self.api setIsLoggedIn:YES];
    [self.api logout];
    if(self.api.isLoggedIn == TRUE){
        NSLog(@"isLoggedIn is TRUE");
    } else {
        NSLog(@"isLoggedIn is FALSE");
    }

    GHAssertTrue(self.api.isLoggedIn, @"Logged in value was set.");
}

@end