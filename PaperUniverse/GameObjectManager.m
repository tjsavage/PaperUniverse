//
//  GameObjectManager.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObjectManager.h"
#import "PlanetFactory.h"
#import "Planet.h"

@implementation GameObjectManager

@synthesize gameObjects = _gameObjects, player = _player;
@synthesize lastPlanet = _lastPlanet;

- (id) init {
    if (self = [super init]) {
        
    }
    
    return self;
}

-(id) initWithDefaultPlayer {
    if (self = [self init]) {
        self.player = [[Spaceship alloc] initWithFile:@"RocketShipSmall.png"];
        [self.player setLocation:CGPointMake(-140, 0)];
        
        self.gameObjects = [NSMutableArray arrayWithObject:self.player];
    }
    
    return self;
}

-(void) updatePositionsForCenter:(CGPoint)center {
    for(SpaceObject *obj in self.gameObjects) {
        obj.position = CGPointMake(obj.location.x - center.x + 240, obj.location.y - center.y + 160);
    }
}

-(Planet *) addPlanet {
    Planet *newPlanet = [[PlanetFactory sharedInstance] nextPlanet];
    
    if (self.lastPlanet == NULL) {
        newPlanet.location = CGPointMake(0, 0);
    } else {
        newPlanet.location = CGPointMake(self.lastPlanet.location.x + 300, self.lastPlanet.location.y + 300);
    }

    
    [self.gameObjects addObject:newPlanet];
    
    self.lastPlanet = newPlanet;
    
    return newPlanet;
}

@end
