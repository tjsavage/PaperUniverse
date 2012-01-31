//
//  PlanetFactory.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlanetFactory.h"
#import "Planet.h"

@interface PlanetFactory()

- (Planet *)randomPlanet;

@end

@implementation PlanetFactory

@synthesize lastPlanet = _lastPlanet;

static PlanetFactory *sharedInstance;

+ (void)initialize {
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sharedInstance = [[PlanetFactory alloc] init];
    }
}

+ (PlanetFactory *)sharedInstance {
    return sharedInstance;
}

- (Planet *)nextPlanet {
    Planet *newPlanet = [self randomPlanet];
        
    self.lastPlanet = newPlanet;
    return newPlanet;
}

- (Planet *)randomPlanet {
    Planet *planet = [[[Planet alloc] initWithFile:@"Planet1.png"] autorelease];
    planet.radius = 100;
    
    return planet;
}

@end
