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
                          @"Table View",
                          @"This is an example of using displaying text with a variable height in a table view.",
                          @"Because the height of each cell must be calculated before the cell is created intrinsic height cannot be used like with the scroll view.",
                          @"Constraints are still used to place the label but the height for the text must be calculated carefully in code.",
                          @"What makes it tricky to calculate in code is the font values which must be precise to get an accurate calculation.",
                          @"Since the calcuation may provide a value which is less then a whole number it is best to round it up or add an extra point value just to make sure it fits. How is it working in the Simulator?"
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
    
    // iOS 6 and before would use this technique
//    CGSize size2 = [text sizeWithFont:self.sampleLabel.font
//                   constrainedToSize:CGSizeMake(280, CGFLOAT_MAX)
//                       lineBreakMode:UILineBreakModeTailTruncation];
//    LOG_SIZE(@"size2", size2);
    
    // the top and bottom are 5 points each making 10 plus 1 more point to account allow for extra space
    // ceilf rounds up to the next whole number
    return ceilf(size.height) + 11;
}

@end
