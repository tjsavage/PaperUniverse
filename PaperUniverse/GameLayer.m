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
#import "PhysicsManagerFloating.h"
#import "BackgroundLayer.h"

@implementation GameLayer

@synthesize backgroundLayer = _backgroundLayer;
@synthesize spaceObjectManager = _spaceObjectManager;
@synthesize centerLocation = _centerLocation;
@synthesize isTouching = _isTouching;
@synthesize currPhysicsManager = _currPhysicsManager, orbitPhysics = _orbitPhysics, floatingPhysics = _floatingPhysics;

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
        self.backgroundLayer = [[BackgroundLayer alloc] init];
        [self addChild:self.backgroundLayer z:0];
        
        self.isTouchEnabled = YES;
        
        self.spaceObjectManager = [[SpaceObjectManager alloc] initWithDefaultPlayer];
        self.orbitPhysics = [[PhysicsManagerOrbiting alloc] init];
        self.floatingPhysics = [[PhysicsManagerFloating alloc] init];
        self.currPhysicsManager = self.floatingPhysics;
        
        Planet *firstPlanet = [self.spaceObjectManager addPlanet];
        
        self.centerLocation = CGPointMake(0, 0);
        
        [self.spaceObjectManager updatePositionsForCenter:self.centerLocation];
        
        
        [self addChild:self.spaceObjectManager.player.sprite z:1];
        [self addChild:firstPlanet.sprite z:1];
        
        [self schedule:@selector(tick:)];
    }
    
    return self;
}

- (void) scale:(CGFloat) newScale scaleCenter:(CGPoint) scaleCenter {
    // scaleCenter is the point to zoom to.. 
    // If you are doing a pinch zoom, this should be the center of your pinch.
    
    // Get the original center point.
    CGPoint oldCenterPoint = ccp(scaleCenter.x * self.scale, scaleCenter.y * self.scale); 
    
    // Set the scale.
    self.scale = newScale;
    
    // Get the new center point.
    CGPoint newCenterPoint = ccp(scaleCenter.x * self.scale, scaleCenter.y * self.scale); 
    
    // Then calculate the delta.
    CGPoint centerPointDelta  = ccpSub(oldCenterPoint, newCenterPoint);
    
    // Now adjust your layer by the delta.
    self.position = ccpAdd(self.position, centerPointDelta);
}

- (void) adjustScaleForCenterLocation:(CGPoint)location {
    double distanceToCover = ccpDistance(self.spaceObjectManager.player.location,
                                         self.spaceObjectManager.activePlanet.location);
    
    double finalScale = MIN(160.0 / distanceToCover, 1);
     
    self.scale = finalScale;
    self.centerLocation = location;
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
    
    if (self.spaceObjectManager.player.isOrbiting) {
        [self.orbitPhysics ejectObject:self.spaceObjectManager.player fromOrbit:self.spaceObjectManager.activePlanet];
        Planet *activePlanet = [self.spaceObjectManager advanceActivePlanet];
        [self addChild:activePlanet.sprite];
    }
    
    self.currPhysicsManager = self.floatingPhysics;
}

- (void)tick:(ccTime)dt {
    [self.currPhysicsManager computeNextLocation:self.spaceObjectManager.player withObjectManager:self.spaceObjectManager afterTimeInterval:dt];
    [self.spaceObjectManager updatePositionsForCenter:self.centerLocation];

    [self adjustScaleForCenterLocation:self.spaceObjectManager.activePlanet.location];
    
}

@end
