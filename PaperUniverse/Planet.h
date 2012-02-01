//
//  Planet.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpaceObject.h"

@interface Planet : SpaceObject

@property (nonatomic, assign) double radius;
@property (nonatomic, assign) double maxOrbitRadius;
@property (nonatomic, assign) double minOrbitRadius;
@property (nonatomic, assign) double orbitalAcceleration;

@end
