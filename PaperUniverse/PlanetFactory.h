//
//  PlanetFactory.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Planet;

@interface PlanetFactory : NSObject

@property (nonatomic, assign) Planet *lastPlanet;

+ (PlanetFactory *)sharedInstance;

- (Planet *)nextPlanet;

@end
