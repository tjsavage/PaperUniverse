//
//  SpaceObject.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpaceObject.h"

@implementation SpaceObject

@synthesize velocity = _velocity, angularVelocity = _angularVelocity, mass = _mass, gravity = _gravity;
@synthesize maxSpeed = _maxSpeed, minSpeed = _minSpeed;
@synthesize isStatic = _isStatic, isOrbiting = _isOrbiting;


-(id) init {
    if (self = [super init]) {
        self.position = CGPointMake(0, 0);
        self.location = CGPointMake(0, 0);
        self.velocity = CGPointMake(0, 0);
        self.orientation = 0;
        self.mass = 10;
        self.gravity = 0;
        self.isStatic = YES;
        self.isOrbiting = NO;
    }
    
    return self;
}

@end
