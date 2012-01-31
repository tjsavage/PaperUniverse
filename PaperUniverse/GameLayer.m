//
//  GameLayer.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "GameObjectManager.h"
#import "Planet.h"

@implementation GameLayer

@synthesize background = _background;
@synthesize gameObjectManager = _gameObjectManager;
@synthesize centerLocation = _centerLocation;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id)init
{
    if(self=[super init]) {        
        self.background = [CCSprite spriteWithFile:@"Background.png" rect:CGRectMake(0, 0, 480, 320)];
        [self.background setPosition:ccp(240, 160)];
        [self addChild:self.background z:0];
        
        self.gameObjectManager = [[GameObjectManager alloc] initWithDefaultPlayer];
        
        Planet *firstPlanet = [self.gameObjectManager addPlanet];
        
        self.centerLocation = CGPointMake(0, 0);
        
        [self.gameObjectManager updatePositionsForCenter:self.centerLocation];
        
        [self addChild:self.gameObjectManager.player.sprite z:1];
        [self addChild:firstPlanet.sprite z:1];
        
        [self schedule:@selector(tick:)];
    }
    
    return self;
}

- (void)tick:(ccTime)dt {
    [self.gameObjectManager updatePositionsForCenter:self.centerLocation];
}

@end
