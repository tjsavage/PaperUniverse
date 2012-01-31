//
//  GameLayer.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/30/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameObjectManager;

@interface GameLayer : CCLayer {
    
}

@property (nonatomic, retain) CCSprite *background;
@property (nonatomic, retain) GameObjectManager *gameObjectManager;
@property (nonatomic, assign) CGPoint centerLocation;

+(CCScene *) scene;

@end
