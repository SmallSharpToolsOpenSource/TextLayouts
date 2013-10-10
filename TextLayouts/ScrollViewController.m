//
//  ScrollViewController.m
//  TextLayouts
//
//  Created by Brennan Stehling on 10/10/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label1.text = @"This is an example of using intrinsic size to allow a scroll view to set the size of the content automatically.";
    self.label2.text = @"The amount of text should directly control the content size and the constraints should increase or decrease the content size accurately.";
    self.label3.text = @"Vertical constraints between the labels will ensure the labels never overlap or are truncated. The labels themselves do not have a height constraint and rely on the intrinsic size of the label instead.";
    self.label4.text = @"If there is enough text the scroll view will go beyond the bounds of the superview and cause the content size to be big enough to ensure that scrolling is possible.";
    self.label5.text = @"In order to allow for a label to wrap to multiple lines the value for lines can be set to the number of lines or 0 to allow for an unlimited number of lines. How does is it working?";
}

@end
