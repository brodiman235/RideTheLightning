//
//  RTLSegmentNodeFactory.h
//  RideTheLightning
//
//  Created by Derek Mordarski on 9/14/14.
//  Copyright (c) 2014 Derek Mordarski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface RTLSegmentNodeFactory : NSObject

+(SKSpriteNode*)createWithStartX:(CGFloat)x startY:(CGFloat)y length:(CGFloat)length;
+(SKShapeNode*)createWithStartX:(CGFloat)x startY:(CGFloat)y endX:(CGFloat)endX endY:(CGFloat)endY;

@end
