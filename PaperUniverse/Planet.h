//
//  Planet.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GravityObject.h"

@interface Planet : GravityObject

@property (nonatomic, assign) double radius;
@property (nonatomic, assign) Planet *nextPlanet;

@end
