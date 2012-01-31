//
//  PhysicsManager.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhysicsManager.h"
#import "GameObject.h"

@implementation PhysicsManager

-(id) init {
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void) computeNextLocation:(GameObject *)object withObjects:(NSArray *)gameObjects afterTimeInterval:(double)dt {
    for (GameObject *currObject in gameObjects) {
        if (currObject != object) {
            
        }
    }
}

@end
