//
//  DraggableImageView.h
//  Tinder
//
//  Created by Jesse Pinho on 11/19/15.
//  Copyright © 2015 Jim Challenger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraggableImageView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
