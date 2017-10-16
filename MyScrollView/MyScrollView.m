//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Nicholas Fung on 2017-10-16.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView


- (IBAction)myScrollViewPanned:(UIPanGestureRecognizer *)sender {
//    CGPoint translationInView = [sender translationInView:self];
//
//    CGPoint oldCenter = sender.view.center;
//    CGPoint newCenter = CGPointMake(oldCenter.x, oldCenter.y + translationInView.y);
//    //self.center  = newCenter;
//    self.bounds = CGRectMake(self.frame.origin.x, self.frame.origin.y + translationInView.y, self.frame.size.width, self.frame.size.height);
//    //sender.view.center = newCenter;
//    //sender.view.frame.
//    [sender setTranslation:CGPointZero inView:self];
    self.contentSize = CGSizeMake(self.bounds.size.width, 760.00);
    
    
    
    CGPoint translation = [sender translationInView:self];
    CGRect bounds = self.bounds;
    
    // Translate the view's bounds, but do not permit values that would violate contentSize
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    [sender setTranslation:CGPointZero inView:self];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
