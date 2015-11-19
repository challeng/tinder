//
//  ViewController.m
//  Tinder
//
//  Created by Jim Challenger on 11/19/15.
//  Copyright © 2015 Jim Challenger. All rights reserved.
//

#import "CardsViewController.h"

@interface CardsViewController ()

@property (nonatomic, assign) CGPoint originalCenter;
@property (weak, nonatomic) IBOutlet UIImageView *profilePhoto;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.profilePhoto.userInteractionEnabled = YES;
}

- (IBAction)onPhotoPan:(UIPanGestureRecognizer *)sender {
    NSLog(@"asdf");
    CGPoint translation = [sender translationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.originalCenter = self.profilePhoto.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat newX = self.originalCenter.x + translation.x;
        self.profilePhoto.center = CGPointMake(newX, self.originalCenter.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^{
            self.profilePhoto.center = self.originalCenter;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
