//
//  TableViewController.m
//  TextLayouts
//
//  Created by Brennan Stehling on 10/10/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;
@property (strong, nonatomic) NSArray *labelContent;

@end

@implementation TableViewController

#pragma mark - View Lifecycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelContent = @[
                          @"This is an example of using intrinsic size to allow a scroll view to set the size of the content automatically.",
                          @"The amount of text should directly control the content size and the constraints should increase or decrease the content size accurately.",
                          @"Vertical constraints between the labels will ensure the labels never overlap or are truncated. The labels themselves do not have a height constraint and rely on the intrinsic size of the label instead.",
                          @"If there is enough text the scroll view will go beyond the bounds of the superview and cause the content size to be big enough to ensure that scrolling is possible.",
                          @"In order to allow for a label to wrap to multiple lines the value for lines can be set to the number of lines or 0 to allow for an unlimited number of lines. How does is it working?"
                          ];
}

#pragma mark - UITableViewDataSource
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.labelContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"LabelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = self.labelContent[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
#pragma mark -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.labelContent[indexPath.row];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{ NSFontAttributeName : self.sampleLabel.font };
    CGSize size = [text boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:options attributes:attributes context:nil].size;
    LOG_SIZE(@"size", size);
    
//    CGSize size2 = [text sizeWithFont:self.sampleLabel.font
//                   constrainedToSize:CGSizeMake(280, CGFLOAT_MAX)
//                       lineBreakMode:UILineBreakModeTailTruncation];
//    LOG_SIZE(@"size2", size2);
    
    return ceilf(size.height) + 11;
}

@end
