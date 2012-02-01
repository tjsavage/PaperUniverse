//
//  Spaceship.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Spaceship.h"

@implementation Spaceship

-(id) init {
    if (self = [super init]) {
        self.isStatic = NO;
        self.gravity = 0;
        self.mass = 10;
        self.orientation = M_PI / 2;
    }
    
    return self;
}

@end
