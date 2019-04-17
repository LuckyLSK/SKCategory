//
//  UIView+SKRectCorner.m
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import "UIView+SKRectCorner.h"
#import <objc/runtime.h>

static NSString * const kcornerRadii = @"rectCornerRadii";
static NSString * const krectCorner = @"rectCorner";

@implementation UIView (SKRectCorner)

- (void)setRectCornerRadii:(CGFloat)rectCornerRadii{
    CGFloat Radii = [objc_getAssociatedObject(self, &kcornerRadii) floatValue];
    if (Radii != rectCornerRadii) {
        [self willChangeValueForKey:kcornerRadii];
        objc_setAssociatedObject(self, &kcornerRadii,
                                 @(rectCornerRadii),
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:kcornerRadii];
        [self rectCornerWithCornerRadii:rectCornerRadii Corner:self.rectCorner];
    }
}

- (CGFloat)rectCornerRadii{
    if (!objc_getAssociatedObject(self, &kcornerRadii)) {
        [self setRectCornerRadii:5];
    }
    return [objc_getAssociatedObject(self, &kcornerRadii) floatValue];
}

- (void)setRectCorner:(UIRectCorner)rectCorner{
    [self willChangeValueForKey:krectCorner];
    objc_setAssociatedObject(self, &krectCorner,
                             @(rectCorner),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:krectCorner];
    
    [self rectCornerWithCornerRadii:self.rectCornerRadii Corner:rectCorner];
}
- (UIRectCorner)rectCorner{
    return [objc_getAssociatedObject(self, &krectCorner) intValue];
}

- (void)rectCornerWithCornerRadii:(CGFloat )cornerRadii Corner:(UIRectCorner)corner{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corner
                                                         cornerRadii:CGSizeMake(cornerRadii,
                                                                                cornerRadii)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
