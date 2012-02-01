//
//  PhysicsManagerOrbiting.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManagerOrbiting.h"
#import "GravityObject.h"
#import "Planet.h"
#import "SpaceObjectManager.h"

@implementation PhysicsManagerOrbiting

@synthesize gravityConstant = _gravityConstant;

- (id)init {
    if (self = [super init]) {
        self.gravityConstant = .8;
    }
    return self;
}

- (void)computeNextLocation:(SpaceObject *)object withObjectManager:(SpaceObjectManager *)objectManager afterTimeInterval:(double)dt {
    [self updateVelocityVector:object withGravityObject:(GravityObject *)objectManager.activePlanet];
    
    object.orientation = ccpToAngle(object.velocity);
    object.location = ccpAdd(object.location, ccpMult(object.velocity, dt));
}

- (void)updateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    double distance = ccpDistance(gravityObject.location, object.location);
    if (distance > gravityObject.maxOrbitRadius){
        return;
    }
    
    CGPoint distanceVector = ccpNormalize(ccpSub(object.location, gravityObject.location));
    
    CGPoint orbitVelocity = ccpNormalize([self closestOrthogonalVectorOf:distanceVector toVector:object.velocity]);
    CGPoint newVelocityVectorDirection = ccpMult(ccpAdd(object.velocity, orbitVelocity), .5);
    
    double gravityForce = gravityObject.gravity * self.gravityConstant * (distance - gravityObject.minOrbitRadius) / gravityObject.maxOrbitRadius;
    CGPoint gravityVector = ccpMult(distanceVector, -gravityForce);
    newVelocityVectorDirection = ccpAdd(gravityVector, newVelocityVectorDirection);
    
    double speed = MAX(MIN(ccpLength(object.velocity) + gravityObject.orbitalAcceleration, object.maxSpeed), object.minSpeed);
    
    object.velocity = ccpMult(ccpNormalize(newVelocityVectorDirection), speed);
}



@end
