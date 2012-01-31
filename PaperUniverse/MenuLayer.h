//
//  MenuLayer.h
//  PaperUniverse
//
//  Created by Taylor Savage on 1/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "chipmunk.h"

@interface MenuLayer : CCLayer {
    cpSpace *space;
}

@property (nonatomic, retain) CCMenu *mainMenu;
@property (nonatomic, retain) CCSprite *background;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) setupMenu;

@end
