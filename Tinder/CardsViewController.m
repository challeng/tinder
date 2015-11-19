//
//  ViewController.m
//  Tinder
//
//  Created by Jim Challenger on 11/19/15.
//  Copyright © 2015 Jim Challenger. All rights reserved.
//

#import "CardsViewController.h"
#import "DraggableImageView.h"

@interface CardsViewController ()

@property (weak, nonatomic) IBOutlet DraggableImageView *profilePhoto;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.profilePhoto.imageView.image = [UIImage imageNamed:@"ryan"];
    self.profilePhoto.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
