//
//  PhysicsManagerOrbiting.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManager.h"

@interface PhysicsManagerOrbiting : PhysicsManager

@property (nonatomic, assign) double gravityConstant;

- (void)computeNextLocation:(SpaceObject *)object withObjects:(NSArray *)spaceObjects afterTimeInterval:(double)dt;

@end
