//
//  CollectionViewController.m
//  TextLayouts
//
//  Created by Brennan Stehling on 10/10/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;

@property (strong, nonatomic) NSArray *labelContent;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation CollectionViewController

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

//- (void)viewDidLayoutSubviews {
//    if (isiOS7OrLater) {
//        DebugLog(@"top layout guide: %f", self.topLayoutGuide.length);
//        self.collectionView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0);
//    }
//}

#pragma mark - UICollectionViewDataSource
#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.labelContent.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"LabelCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = self.labelContent[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
#pragma mark -

#pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.labelContent[indexPath.item];

    UIFont *font = self.sampleLabel.font;
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{ NSFontAttributeName : font };
    CGSize size = [text boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:options attributes:attributes context:nil].size;
    
    return CGSizeMake(320, ceilf(size.height) + 12);
}

@end
