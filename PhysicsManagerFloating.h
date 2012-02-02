//
//  PhysicsManagerFloating.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManager.h"

@class SpaceObject, GravityObject;

@interface PhysicsManagerFloating : PhysicsManager

-(void) guideSpaceObject:(SpaceObject *)object towardGravityObject:(GravityObject *)gravityObject;

@end
