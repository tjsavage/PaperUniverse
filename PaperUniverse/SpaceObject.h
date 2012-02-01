//
//  SpaceObject.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"
#import "cocos2d.h"

@interface SpaceObject : GameObject

@property (nonatomic, assign) CGPoint position, location; //Position represents a point on screen, location maps to a point in our infinite space.
@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) double angularVelocity;
@property (nonatomic, assign) double orientation;
@property (nonatomic, assign) double mass, gravity;
@property (nonatomic, assign) bool isStatic;
@property (nonatomic, retain) CCSprite *sprite;

-(id) init;
-(id) initWithFile:(NSString*)filename;

-(void) setScaleX:(double)x Y:(double)y;
-(void) setScale:(double)scale;


@end
