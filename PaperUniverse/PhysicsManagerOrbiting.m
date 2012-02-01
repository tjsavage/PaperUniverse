//
//  PhysicsManagerOrbiting.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManagerOrbiting.h"
#import "SpaceObject.h"

@implementation PhysicsManagerOrbiting

@synthesize gravityConstant = _gravityConstant;

- (id)init {
    if (self = [super init]) {
        self.gravityConstant = .0008;
    }
    return self;
}

- (void)computeNextLocation:(SpaceObject *)object withObjects:(NSArray *)spaceObjects afterTimeInterval:(double)dt {
    [self updateVelocityVector:object withObjects:spaceObjects];
    
    object.orientation = [self vectorAngle:object.velocity];
    object.location = [self vectorAdd:object.location to:[self scalarMultiply:object.velocity by:dt]];
}

- (void)updateVelocityVector:(SpaceObject *)object withObjects:(NSArray *)spaceObjects {
    CGPoint newVelocity = object.velocity;
    double oldSpeed = [self vectorMagnitude:object.velocity];
    
    for (SpaceObject *currObject in spaceObjects) {
        if (currObject != object) {
            if (currObject.gravity) {
                double distance = [self distanceBetween:currObject andObject:object];
                double gravityForce = currObject.gravity * distance * self.gravityConstant;
                
                CGPoint distanceVector = [self unitVector:[self distanceVectorBetween:currObject andObject:object]];
                NSLog(@"Distance vector: (%f, %f)", distanceVector.x, distanceVector.y);
                CGPoint gravityVector = [self scalarMultiply:distanceVector by:-1.0 * gravityForce];

                
                CGPoint newVelocityVectorDirection = [self closestOrthogonalVectorOf:distanceVector toVector:object.velocity];
                newVelocityVectorDirection = [self vectorAdd:newVelocityVectorDirection to:gravityVector];
                
                newVelocity = [self vectorAdd:newVelocity to:newVelocityVectorDirection];
            }
        }
    }

    object.velocity = newVelocity;
}



@end
