//
//  PhysicsManagerOrbiting.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManager.h"

@class GravityObject;

@interface PhysicsManagerOrbiting : PhysicsManager

@property (nonatomic, assign) double gravityConstant;


-(void) ejectObject:(SpaceObject *)object fromOrbit:(GravityObject *)gravityObject;

@end
