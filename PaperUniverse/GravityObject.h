//
//  GravityObject.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpaceObject.h"

@interface GravityObject : SpaceObject

@property (nonatomic, assign) double gravity;
@property (nonatomic, assign) double maxOrbitRadius;
@property (nonatomic, assign) double minOrbitRadius;
@property (nonatomic, assign) double orbitalAcceleration;

@end
