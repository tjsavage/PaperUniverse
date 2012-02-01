//
//  GameObject.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObject : NSObject

@property (nonatomic, assign) CGPoint position, location; //Position represents a point on screen, location maps to a point in our infinite space.
@property (nonatomic, assign) double orientation;
@property (nonatomic, retain) CCSprite *sprite;

-(id) initWithFile:(NSString*)filename;

-(void) setScaleX:(double)x Y:(double)y;
-(void) setScale:(double)scale;

@end
