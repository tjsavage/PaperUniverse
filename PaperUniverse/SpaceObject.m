//
//  SpaceObject.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpaceObject.h"

@implementation SpaceObject

@synthesize position = _position, location = _location, velocity = _velocity, orientation = _orientation, mass = _mass, gravity = _gravity;
@synthesize isStatic = _isStatic;
@synthesize sprite = _sprite;

-(id) init {
    if (self = [super init]) {
        self.position = CGPointMake(0, 0);
        self.location = CGPointMake(0, 0);
        self.velocity = CGPointMake(0, 0);
        self.orientation = 0;
        self.mass = 10;
        self.gravity = 0;
        self.isStatic = YES;
    }
    
    return self;
}

-(id) initWithFile:(NSString *)filename {
    if (self = [self init]) {
        self.sprite = [CCSprite spriteWithFile:filename];
    }
    
    return self;
}

-(void) setPosition:(CGPoint)position {
    _position = position;
    [self.sprite setPosition:position];
}

-(void) setScaleX:(double)newWidth Y:(double)newHeight {
    [self.sprite setScaleX: newWidth / self.sprite.contentSize.width];
    [self.sprite setScaleY: newHeight / self.sprite.contentSize.height];
}

-(void) setScale:(double)scale {
    [self.sprite setScale:scale]; 
}

@end
