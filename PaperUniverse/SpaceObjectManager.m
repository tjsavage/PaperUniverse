//
//  GameObjectManager.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpaceObjectManager.h"
#import "PlanetFactory.h"
#import "Planet.h"
#import "Spaceship.h"

@interface SpaceObjectManager ()

-(int) closestPlanetToPlayerIndex;

@end

@implementation SpaceObjectManager

@synthesize spaceObjects = _spaceObjects, planets = _planets, player = _player;
@synthesize lastPlanet = _lastPlanet, activePlanet = _activePlanet;

- (id) init {
    if (self = [super init]) {
        self.planets = [NSMutableArray array];
    }
    
    return self;
}

-(id) initWithDefaultPlayer {
    if (self = [self init]) {
        self.player = [[Spaceship alloc] initWithFile:@"RocketShipSmall.png"];
        [self.player setLocation:CGPointMake(-140, 0)];
        
        self.spaceObjects = [NSMutableArray arrayWithObject:self.player];
    }
    
    return self;
}

-(void) updatePositionsForCenter:(CGPoint)center {
    for(SpaceObject *obj in self.spaceObjects) {
        obj.position = CGPointMake(obj.location.x - center.x + 240, obj.location.y - center.y + 160);
    }
}

-(Planet *) activePlanet {
    if (_activePlanet == NULL) {
        _activePlanetIndex = self.closestPlanetToPlayerIndex;
        _activePlanet = [self.planets objectAtIndex:_activePlanetIndex];
        return _activePlanet;
    }
    
    if (ccpDistance(_activePlanet.location, self.player.location) > _activePlanet.maxOrbitRadius) {
        _activePlanetIndex++;
        if (_activePlanetIndex < self.planets.count) {
            _activePlanet = [self.planets objectAtIndex:_activePlanetIndex];
        } else {
            _activePlanetIndex = self.closestPlanetToPlayerIndex;
            _activePlanet = [self.planets objectAtIndex:_activePlanetIndex];
            return _activePlanet;
        }
        return _activePlanet;
    }
    
    return _activePlanet;
}
        
-(int) closestPlanetToPlayerIndex {
    double closestDistance = 99999999;
    int closestPlanetIndex;
    for(int i = 0; i < self.planets.count; i++) {
        Planet *planet = [self.planets objectAtIndex:i];
        double distance = ccpDistance(planet.location, self.player.location);
        if (distance < closestDistance) {
            closestDistance = distance;
            closestPlanetIndex = i;
        }
    }
    
    return closestPlanetIndex;
}

-(Planet *) closestPlanetToPlayer {
    return [self.planets objectAtIndex:self.closestPlanetToPlayerIndex];
}

-(Planet *) addPlanet {
    Planet *newPlanet = [[PlanetFactory sharedInstance] nextPlanet];
    
    if (self.lastPlanet == NULL) {
        newPlanet.location = CGPointMake(0, 0);
    } else {
        newPlanet.location = CGPointMake(self.lastPlanet.location.x + 3000, self.lastPlanet.location.y);
    }

    
    [self.spaceObjects addObject:newPlanet];
    [self.planets addObject:newPlanet];
    
    self.lastPlanet = newPlanet;
    
    return newPlanet;
}

@end
