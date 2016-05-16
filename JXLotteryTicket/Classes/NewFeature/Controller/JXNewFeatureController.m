//
//  JXNewFeatureController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/13.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXNewFeatureController.h"
#import "JXNewFeatureCell.h"

#define kCount 4
@interface JXNewFeatureController ()

/** 位置 */
@property (nonatomic,assign) CGFloat oldOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;

@end

@implementation JXNewFeatureController

static NSString * const reuseIdentifier = @"Cell";


/**
 *  封装流水布局
 */
- (instancetype)init {
    // 初始化的时候必须指定流水布局对象
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    // item尺寸
    layout.itemSize = JXBouns.size;
    // item列之间间距
    layout.minimumInteritemSpacing = 0;
    // item行之间间距
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}


// UICollectionView的底层
// UICollectionViewController层次结构：控制器View 上面UICollectionView
// self.view != self.collectionView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.bounces = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    // Register cell classes
    [self.collectionView registerClass:[JXNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupAllChildView];
}

// 添加图片
- (void)setupAllChildView {
    
    UIImageView * guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    _guideView = guide;
    guide.centerX = self.view.centerX;
    
    
    [self.collectionView addSubview:guide];
    
    // guideLine
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 170;
    
    [self.collectionView addSubview:guideLine];
    
    // largerText
    UIImageView *largerText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largerText.centerX = self.view.centerX;
    largerText.centerY = self.view.height * 0.8;
    _guideLargetView = largerText;
    [self.collectionView addSubview:largerText];
    
    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _guideSmallView = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.height * 0.85;
    [self.collectionView addSubview:smallText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JXNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    [cell showButtonIndex:indexPath count:kCount];
    return cell;
}


#pragma mark - 滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat distance = offsetX - self.oldOffsetX;
    
    // 先将位置移动到下一个位置
    self.guideLargetView.x += distance * 2;
    self.guideSmallView.x += distance * 2;
    self.guideView.x += distance * 2;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.guideView.x -= distance;
        self.guideSmallView.x -= distance;
        self.guideLargetView.x -= distance;
    }];
    int page = offsetX / JXWidth + 1;
    // 修改控件的内容
    self.guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    self.oldOffsetX = offsetX;
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
