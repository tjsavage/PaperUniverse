//
//  BackgroundLayer.m
//  PaperUniverse
//
//  Created by Taylor Savage on 1/31/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"
#import "BackgroundTile.h"

#define NUM_TILES 16
#define NUM_TILES_PER_SIDE 4

@implementation BackgroundLayer

@synthesize backgroundTiles = _backgroundTiles;

-(id) init {
    if (self = [super init]) {
        self.backgroundTiles = [NSMutableArray array];
        for (int i = 0; i < NUM_TILES; i++) {
            BackgroundTile *backgroundTile = [[[BackgroundTile alloc] initWithFile:@"Background.png"] autorelease];
            // backgroundTile setLocation:CGPointMake(i % 4, (i / 4) * )
            
        }
    }
    
    return self;
}

@end
