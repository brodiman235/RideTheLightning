//
//  RTLSegmentNodeFactory.m
//  RideTheLightning
//
//  Created by Derek Mordarski on 9/14/14.
//  Copyright (c) 2014 Derek Mordarski. All rights reserved.
//

#import "RTLSegmentNodeFactory.h"

@implementation RTLSegmentNodeFactory

+(SKSpriteNode*)createWithStartX:(CGFloat)x startY:(CGFloat)y length:(CGFloat)length {
    // NOTE: using SKSPriteNode instead of SKShapeNode for now due to memory leak issues with SKShapeNode
    
    SKSpriteNode* line = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(length, 2.0)];
    [line setPosition:CGPointMake(x, y)];
    
    return line;
    
}

+(SKShapeNode*)createWithStartX:(CGFloat)x startY:(CGFloat)y endX:(CGFloat)endX endY:(CGFloat)endY {

    SKShapeNode *line = [SKShapeNode node];
    CGMutablePathRef pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL, x, y);
    CGPathAddLineToPoint(pathToDraw, NULL, endX, endY);
    line.path = pathToDraw;
    line.strokeColor = [SKColor yellowColor];
    
    CGPathRelease(pathToDraw);
    return line;
}

@end
