//
//  GameLayer.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "CCTouchDispatcher.h"

#import "GameLayer.h"
#import "SpaceObjectManager.h"
#import "Spaceship.h"
#import "Planet.h"
#import "PhysicsManager.h"
#import "PhysicsManagerOrbiting.h"

@implementation GameLayer

@synthesize background = _background;
@synthesize spaceObjectManager = _spaceObjectManager;
@synthesize centerLocation = _centerLocation;
@synthesize isTouching = _isTouching;
@synthesize currPhysicsManager = _currPhysicsManager, orbitPhysics = _orbitPhysics;

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
        
        self.isTouchEnabled = YES;
        
        self.spaceObjectManager = [[SpaceObjectManager alloc] initWithDefaultPlayer];
        self.orbitPhysics = [[PhysicsManagerOrbiting alloc] init];
        
        Planet *firstPlanet = [self.spaceObjectManager addPlanet];
        
        self.centerLocation = CGPointMake(0, 0);
        
        [self.spaceObjectManager updatePositionsForCenter:self.centerLocation];
        
        
        [self addChild:self.spaceObjectManager.player.sprite z:1];
        [self addChild:firstPlanet.sprite z:1];
        
        [self schedule:@selector(tick:)];
    }
    
    return self;
}

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    self.isTouching = YES;
    self.currPhysicsManager = self.orbitPhysics;
    return YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    self.isTouching = NO;
}

- (void)tick:(ccTime)dt {
    [self.currPhysicsManager computeNextLocation:self.spaceObjectManager.player withObjects:self.spaceObjectManager.spaceObjects afterTimeInterval:dt];
    [self.spaceObjectManager updatePositionsForCenter:self.centerLocation];
}

@end
