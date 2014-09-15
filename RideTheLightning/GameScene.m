//
//  GameScene.m
//  RideTheLightning
//
//  Created by Derek Mordarski on 9/14/14.
//  Copyright (c) 2014 Derek Mordarski. All rights reserved.
//

#import "GameScene.h"
#import "RTLSegmentNodeFactory.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))
#define randomBOOL() (arc4random_uniform(200) % 10 == 0)
#define randomBOOL2() (arc4random_uniform(1) == 0)

@interface GameScene()
@property (nonatomic) BOOL running;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    
    


}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        // start at the top (size.height) and move to the bottom (0.0)
        self.running = YES;
    }
    return self;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (self.running) {
            self.running = NO;
        } else {
            [self removeAllChildren];
            [self createBoltAtX:location.x atY:location.y maxX:self.size.width maxY:0.0 node:self];
        }
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (self.running) {
        [self removeAllChildren];
        [self createBoltAtX:self.size.width/2 atY:self.size.height maxX:self.size.width maxY:0.0 node:self];
        // TODO: add fade action
        
    }
}

-(void)createBoltAtX:(CGFloat)x atY:(CGFloat)y maxX:(CGFloat)maxX maxY:(CGFloat)maxY node:(SKNode*)node {
    
    CGFloat endX = 0.0;
    CGFloat endY = 0.0;
    BOOL shouldContinueAdding = randomBOOL2() || node == self;
    while(y > maxY && shouldContinueAdding) {
        endX = x + RAND_FROM_TO(-30.0, 30.0);
//        endY = y - RAND_FROM_TO(5.0, 20.0);
        endY = y - RAND_FROM_TO(10.0, 30.0);
        
        SKShapeNode *child =
            [RTLSegmentNodeFactory createWithStartX:x
                                             startY:y
                                               endX:endX
                                               endY:endY];
        x = endX;
        y = endY;
        child.glowWidth = 3.5;
        
        SKAction *action = [SKAction fadeAlphaTo:0.0f duration:1.0f];
        SKAction *removeNode = [SKAction removeFromParent];
        [child runAction:[SKAction sequence:@[action, removeNode]]];
        
        [node addChild:child];
        
        // randomly branch
        if (randomBOOL()) {
//            NSLog(@"branching..");
            [self createBoltAtX:x atY:y maxX:maxX maxY:maxY node:child];
        }
    }

    
}

@end
