//
//  RTLSegmentNode.h
//  RideTheLightning
//
//  Created by Derek Mordarski on 9/14/14.
//  Copyright (c) 2014 Derek Mordarski. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RTLSegment : NSObject

-(id)initWithSKNode:(SKNode*) node;

@property (nonatomic) SKNode* node;
@property (nonatomic, weak) RTLSegment *before;
@property (nonatomic, weak) RTLSegment *after;
@end
