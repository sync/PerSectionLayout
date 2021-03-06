//
//  Copyright (c) 2014 REA Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AMPerSectionCollectionViewLayoutItem;
@class AMPerSectionCollectionViewLayoutSection;

@interface AMPerSectionCollectionViewLayoutRow : NSObject

- (NSArray *)layoutSectionItems;
- (void)addItem:(AMPerSectionCollectionViewLayoutItem *)item;
- (NSInteger)itemsCount;
- (void)computeLayoutInSection:(AMPerSectionCollectionViewLayoutSection *)section;
- (void)invalidate __unused;

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) NSInteger index;

@end
