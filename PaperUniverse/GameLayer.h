//
//  GameLayer.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class SpaceObjectManager, PhysicsManager, PhysicsManagerOrbiting, PhysicsManagerFloating;

@interface GameLayer : CCLayer {
    
}

@property (nonatomic, retain) CCSprite *background;
@property (nonatomic, retain) SpaceObjectManager *spaceObjectManager;
@property (nonatomic, assign) CGPoint centerLocation;
@property (nonatomic, assign) BOOL isTouching;


@property (nonatomic, retain) PhysicsManagerOrbiting *orbitPhysics;
@property (nonatomic, retain) PhysicsManagerFloating *floatingPhysics;

@property (nonatomic, assign) PhysicsManager *currPhysicsManager;

+(CCScene *) scene;

@end
