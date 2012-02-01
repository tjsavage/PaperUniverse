//
//  PhysicsManager.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManager.h"
#import "SpaceObjectManager.h"
#import "GameObject.h"
#import "SpaceObject.h"

@implementation PhysicsManager

-(id) init {
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)updateSpaceObjects:(SpaceObjectManager *)objectManager afterTimeInterval:(double)dt {
    for (SpaceObject *obj in objectManager.spaceObjects) {
        [self computeNextLocation:obj withObjectManager:objectManager afterTimeInterval:dt];
    }
}

-(void) computeNextLocation:(SpaceObject *)object withObjectManager:(SpaceObjectManager *)objectManager afterTimeInterval:(double)dt {
    
}

- (void)updateVelocityVector:(SpaceObject *)object withGravityObject:(GravityObject *)gravityObject {
    
}

- (double)distanceBetween:(SpaceObject *)obj1 andObject:(SpaceObject *)obj2 {
    return sqrt(pow((obj1.location.x - obj2.location.x), 2) + pow((obj1.location.y - obj2.location.y), 2));
}

- (CGPoint)distanceVectorBetween:(SpaceObject *)obj1 andObject:(SpaceObject *)obj2 {
    return CGPointMake(obj2.location.x - obj1.location.x, obj2.location.y - obj1.location.y);
}

- (CGPoint)closestOrthogonalVectorOf:(CGPoint)orthoVector toVector:(CGPoint)matchingVector {
    CGPoint tangentVector = CGPointMake(orthoVector.y, -orthoVector.x);
    if (abs(ccpAngle(matchingVector, tangentVector)) > M_PI / 2) {
        return CGPointMake(-tangentVector.x, -tangentVector.y);
    }
    return tangentVector;
}

- (double)vectorSlope:(CGPoint)vector {
    return vector.y / vector.x;
}

- (double)vectorAngle:(CGPoint)vector {
    return atan2(vector.y, vector.x);
}

- (double)vectorMagnitude:(CGPoint)vector {
    return sqrt(pow(vector.x, 2) + pow(vector.y, 2));
}

- (CGPoint)vectorParallelTo:(CGPoint)vector withMagnitude:(double)magnitude {
    return CGPointMake(vector.x / [self vectorMagnitude:vector] * magnitude, vector.y / [self vectorMagnitude:vector] * magnitude);
}

- (CGPoint)scalarMultiply:(CGPoint)vector by:(double)scalar {
    return CGPointMake(vector.x * scalar, vector.y * scalar);
}

- (CGPoint)vectorAdd:(CGPoint)vec1 to:(CGPoint)vec2 {
    return CGPointMake(vec1.x + vec2.x, vec1.y + vec2.y);
}

- (CGPoint)unitVector:(CGPoint)vector {
    return [self scalarMultiply:vector by:1 / [self vectorMagnitude:vector]];
}


@end
