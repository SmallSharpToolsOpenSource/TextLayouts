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
                          @"Collection View",
                          @"This is an example of using a collection view to display the text much like the table view.",
                          @"Because the height of each cell must be calculated before the cell is created intrinsic height cannot be used like with the scroll view.",
                          @"Constraints are still used to place the label but the height for the text must be calculated carefully in code.",
                          @"What makes it tricky to calculate in code is the font values which must be precise to get an accurate calculation.",
                          @"Since the calcuation may provide a value which is less then a whole number it is best to round it up or add an extra point value just to make sure it fits. How is it working in the Simulator?",
                          @"Retro bicycle rights distillery scenester XOXO, Odd Future put a bird on it gluten-free 8-bit chia Intelligentsia Portland Austin Carles Pinterest.",
                          @"Freegan messenger bag master cleanse gastropub, kale chips mumblecore mustache Tonx drinking vinegar Godard Carles banh mi hoodie craft beer.",
                          @"Flexitarian seitan fingerstache, letterpress tousled bitters XOXO deep v biodiesel wayfarers Vice.",
                          @"Farm-to-table pour-over asymmetrical, PBR&B Terry Richardson selfies bespoke meh."
                          ];
}

// top and bottom layout guide could be used if the content insets are not set automatically (won't be set in viewDidLoad because constraints must be applied first)
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

// nothing needed

#pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark -

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.labelContent[indexPath.item];

    UIFont *font = self.sampleLabel.font;
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{ NSFontAttributeName : font };
    CGSize size = [text boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:options attributes:attributes context:nil].size;
    
    // ceilf rounds up to the next whole number
    return CGSizeMake(320, ceilf(size.height) + 11);
}

@end
