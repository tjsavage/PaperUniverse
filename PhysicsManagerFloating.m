//
//  PhysicsManagerFloating.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManagerFloating.h"
#import "SpaceObject.h"

@implementation PhysicsManagerFloating

- (void)computeNextLocation:(SpaceObject *)object withObjectManager:(SpaceObjectManager *)objectManager afterTimeInterval:(double)dt {
    object.orientation += object.angularVelocity;
    
    object.location = [self vectorAdd:object.location to:[self scalarMultiply:object.velocity by:dt]];
}

@end
