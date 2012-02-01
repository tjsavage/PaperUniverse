//
//  SpaceObjectManager.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Planet, Spaceship;

@interface SpaceObjectManager : NSObject {
    @private
    int _activePlanetIndex;
}

@property (nonatomic, retain) Spaceship *player;
@property (nonatomic, retain) NSMutableArray *spaceObjects, *planets;
@property (nonatomic, assign) Planet *lastPlanet, *activePlanet;

-(id) init;
-(id) initWithDefaultPlayer;

-(void) updatePositionsForCenter:(CGPoint)center;
-(Planet *) addPlanet;
-(Planet *) closestPlanetToPlayer;

@end
