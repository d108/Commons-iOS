//
//  MWApi+Testing.h
//  Commons-iOS
//
//  Created by Daniel Zhang (張道博) on 2/19/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWApi.h"

@interface MWApi (Testing)
-(id)getUserName;
-(void)setUserName:(NSString *)name;
-(BOOL)getIsLoggedIn;
-(void)setIsLoggedIn:(BOOL)state;
@end
