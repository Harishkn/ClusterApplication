//
//  MapAnnotation.m
//  ClusterApp
//
//  Created by test on 11/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "MapAnnotation.h"


@implementation MapAnnotation

-(id)initWithTitle:(NSString *)title andCoordinate:
(CLLocationCoordinate2D)coordinate2d{
    self.title = title;
    self.coordinate =coordinate2d;
    return self;
}

@end
