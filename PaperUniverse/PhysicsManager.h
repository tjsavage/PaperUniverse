//
//  PhysicsManager.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpaceObject;

@interface PhysicsManager : NSObject

- (id)init;
- (void)computeNextLocation:(SpaceObject *)object withObjects:(NSArray *)spaceObjects afterTimeInterval:(double)dt;
- (void)updateSpaceObjects:(NSArray *)spaceObjects afterTimeInterval:(double)dt;
- (double)distanceBetween:(SpaceObject *)obj1 andObject:(SpaceObject *)obj2;
- (CGPoint)distanceVectorBetween:(SpaceObject *)obj1 andObject:(SpaceObject *)obj2;
- (CGPoint)closestOrthogonalVectorOf:(CGPoint)orthoVector toVector:(CGPoint)matchingVector;
- (double)vectorSlope:(CGPoint)vector;
- (double)vectorAngle:(CGPoint)vector;
- (void)updateVelocityVector:(SpaceObject *)object withObjects:(NSArray *)spaceObjects;
- (CGPoint)vectorParallelTo:(CGPoint)vector withMagnitude:(double)magnitude;
- (double)vectorMagnitude:(CGPoint)vector;
- (CGPoint)scalarMultiply:(CGPoint)vector by:(double)scalar;
- (CGPoint)vectorAdd:(CGPoint)vec1 to:(CGPoint)vec2;
- (CGPoint)unitVector:(CGPoint)vector;

@end

