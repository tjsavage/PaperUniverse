//
//  GameObject.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

@synthesize position = _position, location = _location, orientation = _orientation;
@synthesize sprite = _sprite;

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


-(void) setOrientation:(double)orientation {
    _orientation = orientation;
    [self.sprite setRotation:-orientation * 180 / M_PI];
}

-(void) setScaleX:(double)newWidth Y:(double)newHeight {
    [self.sprite setScaleX: newWidth / self.sprite.contentSize.width];
    [self.sprite setScaleY: newHeight / self.sprite.contentSize.height];
}

-(void) setScale:(double)scale {
    [self.sprite setScale:scale]; 
}

@end
