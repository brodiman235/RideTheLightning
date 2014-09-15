//
//  RTLSegmentNode.m
//  RideTheLightning
//
//  Created by Derek Mordarski on 9/14/14.
//  Copyright (c) 2014 Derek Mordarski. All rights reserved.
//

#import "RTLSegment.h"

@implementation RTLSegment

@synthesize before, after;

-(id)initWithSKNode:(SKNode*) node {
    
    if (self = [super init]) {
        _node = node;
    }
    
    return self;
}

@end
