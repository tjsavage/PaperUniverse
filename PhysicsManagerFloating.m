//
//  PhysicsManagerFloating.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManagerFloating.h"
#import "SpaceObject.h"
#import "SpaceObjectManager.h"
#import "Spaceship.h"
#import "GravityObject.h"
#import "Planet.h"

@implementation PhysicsManagerFloating

- (void)computeNextLocation:(SpaceObject *)object withObjectManager:(SpaceObjectManager *)objectManager afterTimeInterval:(double)dt {
    object.orientation += object.angularVelocity;
    
    if ([object isMemberOfClass:[Spaceship class]]) {
        object.orientation = ccpToAngle(object.velocity);
        [self guideSpaceObject:object towardGravityObject:objectManager.activePlanet];
    }
    
    object.location = [self vectorAdd:object.location to:[self scalarMultiply:object.velocity by:dt]];
}

- (void)guideSpaceObject:(SpaceObject *)object towardGravityObject:(GravityObject *)gravityObject {
    double distance = ccpDistance(object.location, gravityObject.location);
    
    if (distance < gravityObject.maxOrbitRadius || distance > gravityObject.attractionDistance) {
        return;
    }
    
    
    CGPoint vectorToPlanet = ccpNormalize(ccpSub(gravityObject.location, object.location));
    CGPoint perpToPlanet = ccpMult(ccpRPerp(vectorToPlanet), gravityObject.minOrbitRadius + 300);
    CGPoint orbitalPointLocation = ccpSub(gravityObject.location, perpToPlanet);
    
    CGPoint directToOrbitPoint = ccpNormalize(ccpSub(orbitalPointLocation, object.location));
    CGPoint normalizedVelocity = ccpNormalize(object.velocity);
    double speed = ccpLength(object.velocity);
    
    object.velocity = ccpMult(ccpAdd(ccpMult(normalizedVelocity, .9), ccpMult(directToOrbitPoint, .1)), speed);
}

@end
