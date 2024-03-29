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

@interface PhysicsManagerOrbiting ()

- (BOOL)gravityUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject;
- (BOOL)simpleUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject;
- (BOOL)pullLockUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject;

@end

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

-(void) ejectObject:(SpaceObject *)object fromOrbit:(GravityObject *)gravityObject {
    object.isOrbiting = NO;
    object.velocity = ccpMult(object.velocity, 1.5);
}


- (void)updateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    object.isOrbiting = [self pullLockUpdateVelocityVector:object withGravityObject:gravityObject];
}

- (BOOL)simpleUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    double distance = ccpDistance(gravityObject.location, object.location);
    if (distance > gravityObject.maxOrbitRadius){
        return NO;
    }
    
    CGPoint distanceVector = ccpNormalize(ccpSub(object.location, gravityObject.location));
    CGPoint orbitVelocity = ccpNormalize([self closestOrthogonalVectorOf:distanceVector toVector:object.velocity]);
    
    object.velocity = ccpMult(orbitVelocity, ccpLength(object.velocity));
    
    return YES;
}

- (BOOL)pullLockUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    double distance = ccpDistance(gravityObject.location, object.location);
    if (distance > gravityObject.maxOrbitRadius){
        return NO;
    }
    
    CGPoint distanceVector = ccpNormalize(ccpSub(object.location, gravityObject.location));
    CGPoint orbitVelocity = ccpNormalize([self closestOrthogonalVectorOf:distanceVector toVector:object.velocity]);
    CGPoint newVelocity = ccpMult(ccpAdd(ccpNormalize(object.velocity), orbitVelocity), .96);
    
    double pullVectorMagnitude = MAX((distance - gravityObject.minOrbitRadius) / 1000, 0);
    CGPoint pullVector = ccpMult(distanceVector, -pullVectorMagnitude);
    
    CGPoint newVector = ccpNormalize(ccpAdd(pullVector, newVelocity));
    
    object.velocity = ccpMult(newVector, ccpLength(object.velocity));
    
    return YES;
}

- (BOOL)gravityUpdateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    double distance = ccpDistance(gravityObject.location, object.location);
    if (distance > gravityObject.maxOrbitRadius){
        return NO;
    }
    
    CGPoint distanceVector = ccpNormalize(ccpSub(object.location, gravityObject.location));
    
    CGPoint orbitVelocity = ccpNormalize([self closestOrthogonalVectorOf:distanceVector toVector:object.velocity]);
    CGPoint newVelocityVectorDirection = ccpMult(ccpAdd(object.velocity, orbitVelocity), .5);
    
    double gravityForce = gravityObject.gravity * self.gravityConstant * (distance - gravityObject.minOrbitRadius) / gravityObject.maxOrbitRadius;
    CGPoint gravityVector = ccpMult(distanceVector, -gravityForce);
    newVelocityVectorDirection = ccpAdd(gravityVector, newVelocityVectorDirection);
    
    double speed = MAX(MIN(ccpLength(object.velocity) + gravityObject.orbitalAcceleration, object.maxSpeed), object.minSpeed);
    
    object.velocity = ccpMult(ccpNormalize(newVelocityVectorDirection), speed);

    return YES;
}




@end
