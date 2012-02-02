//
//  SpaceObject.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"
#import "cocos2d.h"

@interface SpaceObject : GameObject

@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) double maxSpeed, minSpeed;
@property (nonatomic, assign) double angularVelocity;
@property (nonatomic, assign) double mass, gravity;
@property (nonatomic, assign) bool isStatic, isOrbiting;

-(id) init;



@end
