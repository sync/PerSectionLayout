//
//  Copyright (c) 2014 Dblechoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainSections.h"
#import <PerSectionLayout/AMPerSectionCollectionViewLayout.h>

@protocol AMSectionController <NSObject, UICollectionViewDataSource, AMPerSectionCollectionViewLayoutDelegate>

- (NSInteger)section;
- (void)registerCustomElementsForCollectionView:(UICollectionView *)collectionView;

@end
