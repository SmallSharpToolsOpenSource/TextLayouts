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
@property (weak, nonatomic) IBOutlet UILabel *label6;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *labelContent = @[
                              @"Scroll View",
                              @"This is an example of using intrinsic size to allow a scroll view to set the size of the content automatically.",
                              @"The amount of text should directly control the content size and the constraints should increase or decrease the content size accurately.",
                              @"Vertical constraints between the labels will ensure the labels never overlap or are truncated. The labels themselves do not have a height constraint and rely on the intrinsic size of the label instead.",
                              @"If there is enough text the scroll view will go beyond the bounds of the superview and cause the content size to be big enough to ensure that scrolling is possible.",
                              @"In order to allow for a label to wrap to multiple lines the value for lines can be set to the number of lines or 0 to allow for an unlimited number of lines. How is it working in the Simulator?"
                              ];
    
    self.label1.text = labelContent[0];
    self.label2.text = labelContent[1];
    self.label3.text = labelContent[2];
    self.label4.text = labelContent[3];
    self.label5.text = labelContent[4];
    self.label6.text = labelContent[5];
}

@end
