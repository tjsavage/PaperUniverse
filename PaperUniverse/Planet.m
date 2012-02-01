//
//  Planet.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Planet.h"

@implementation Planet

@synthesize radius = _radius;

-(id) init {
    if (self = [super init]) {
        self.isStatic = YES;
        self.gravity = 100;
        self.mass = 100;
        self.orbitalAcceleration = 5;
    }
    
    return self;
}

@end
