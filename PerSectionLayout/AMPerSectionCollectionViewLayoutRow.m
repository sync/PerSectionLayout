//
//  Copyright (c) 2014 Dblechoc. All rights reserved.
//

#import "AMPerSectionCollectionViewLayoutRow.h"
#import "AMPerSectionCollectionViewLayoutSection.h"
#import "AMPerSectionCollectionViewLayoutInfo.h"

@interface AMPerSectionCollectionViewLayoutRow ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation AMPerSectionCollectionViewLayoutRow
@dynamic itemsCount;

- (id)init
{
    self = [super init];
    if (self)
    {
        _items = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Items

- (NSArray *)layoutSectionItems
{
    return [self.items copy];
}

- (void)addItem:(AMPerSectionCollectionViewLayoutItem *)item
{
    [self.items addObject:item];
    item.row = self;

    [self invalidate];
}

- (NSInteger)itemsCount
{
    return (NSInteger)[self.items count];
}

#pragma mark - Layout

- (void)invalidate
{
	self.size = CGSizeZero;
	self.frame = CGRectZero;
}

- (void)computeLayout:(__unused AMPerSectionCollectionViewLayoutInfo *)layoutInfo inSection:(AMPerSectionCollectionViewLayoutSection *)section
{
    CGPoint itemOffset = CGPointZero;
    CGRect frame = CGRectZero;
    CGRect itemFrame = CGRectZero;

    for (AMPerSectionCollectionViewLayoutItem *item in self.items)
    {
        itemFrame = item.frame;
        itemFrame.origin.x = itemOffset.x;
        itemFrame.origin.y = itemOffset.y;

        itemOffset.x += itemFrame.size.width + section.horizontalInterstice;

        item.frame = CGRectIntegral(itemFrame);
        frame = CGRectUnion(frame, itemFrame);
    }
    
    self.size = frame.size;
}

#pragma mark - NSObject

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p frame:%@ index:%ld items:%@>", NSStringFromClass([self class]), self, NSStringFromCGRect(self.frame), (long)self.index, self.items];
}

@end
