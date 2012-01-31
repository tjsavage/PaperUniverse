//
//  GameObjectManager.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"
#import "Spaceship.h"

@class Planet;

@interface GameObjectManager : NSObject

@property (nonatomic, retain) Spaceship *player;
@property (nonatomic, retain) NSMutableArray *gameObjects;
@property (nonatomic, assign) Planet *lastPlanet;

-(id) init;
-(id) initWithDefaultPlayer;

-(void) updatePositionsForCenter:(CGPoint)center;
-(Planet *) addPlanet;

@end
