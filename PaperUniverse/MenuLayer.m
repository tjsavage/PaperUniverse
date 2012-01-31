//
//  MenuLayer.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "GameLayer.h"


@implementation MenuLayer

@synthesize mainMenu = _mainMenu;
@synthesize background = _background;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MenuLayer *layer = [MenuLayer node];
	
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
        
        [self setupMenu];
        
        [self addChild:self.mainMenu];
    }
    
    return self;
}

- (void)setupMenu {
    CCMenuItemImage *playGameMenuItem = [CCMenuItemImage itemFromNormalImage:@"playGameButton.png" 
                                                               selectedImage:@"playGameButton_selected.png" 
                                                                      target:self 
                                                                    selector:@selector(startGame)];
    self.mainMenu = [CCMenu menuWithItems:playGameMenuItem, nil];
    
    [self.mainMenu alignItemsVertically];
}

- (void)startGame {
    [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
}

@end
