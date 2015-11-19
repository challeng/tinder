//
//  DraggableImageView.m
//  Tinder
//
//  Created by Jesse Pinho on 11/19/15.
//  Copyright © 2015 Jim Challenger. All rights reserved.
//

#import "DraggableImageView.h"

@interface DraggableImageView ()
@property (nonatomic, assign) CGPoint originalCenter;
@property (nonatomic, assign) CGPoint originalGestureLocation;
@end

@implementation DraggableImageView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    UINib *nib = [UINib nibWithNibName:@"DraggableImageView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    self.contentView.frame = self.bounds;
    self.imageView.frame = self.bounds;
    [self addSubview:self.contentView];
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)];
    [self.contentView addGestureRecognizer:gestureRecognizer];
}

- (void)onPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.superview];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.originalCenter = self.contentView.center;
        self.originalGestureLocation = [sender locationInView:self];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat multiplier;
        if (self.originalGestureLocation.y > self.originalCenter.y) {
            multiplier = -1;
        } else {
            multiplier = 1;
        }
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI / 180 * translation.x / 15 * multiplier);
        [self setTransform:transform];
        CGFloat newX = self.originalCenter.x + translation.x;
        self.contentView.center = CGPointMake(newX, self.originalCenter.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:.2 animations:^{
            self.contentView.center = self.originalCenter;
            [self setTransform:CGAffineTransformMakeRotation(0)];
        }];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
