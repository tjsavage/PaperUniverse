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
@synthesize nextPlanet = _nextPlanet;

-(id) init {
    if (self = [super init]) {
        self.isStatic = YES;
        self.gravity = 100;
        self.mass = 100;
        self.orbitalAcceleration = 5;
        
        self.aimRadius = (self.minOrbitRadius + self.maxOrbitRadius) / 2;
        self.attractionDistance = self.maxOrbitRadius * 2;
        
        self.nextPlanet = NULL;
    }
    
    return self;
}

@end
