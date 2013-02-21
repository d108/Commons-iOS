//
//  MWApi+Testing.m
//  Commons-iOS
//
//  Created by Daniel Zhang (張道博) on 2/19/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import "MWApi+Testing.h"

/**
 * Category for using private vars in MWApi.
 */

@implementation MWApi (Testing)

/**
 * Get the user name.
 * @return username
 */
-(id)getUserName
{
    return userName_;
}

/**
 * Set the user name.
 * @param name
 */
-(void)setUserName:(NSString *)name
{
    userName_ = name;
}

/**
 * Get isLoggedIn value.
 * @return boolean value of isLoggedIn.
 */
-(BOOL)getIsLoggedIn
{
    return isLoggedIn_;
}

/**
 * Set is logged in state.
 * @param state
 */
-(void)setIsLoggedIn:(BOOL)state
{
    isLoggedIn_ = state;
}

@end
