//
//  ViewController.m
//  W3D3 - CollectionViews
//
//  Created by Daniel Mathews on 2015-09-09.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "HeaderCollectionReusableView.h"
#import "FooterCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) UICollectionViewFlowLayout *smallLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(clickedPlay:)];
    self.navigationItem.rightBarButtonItem = playButton;
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(100, 100);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 15;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
//    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.smallLayout = [[UICollectionViewFlowLayout alloc] init];
    self.smallLayout.itemSize = CGSizeMake(50, 50);
    self.smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.smallLayout.minimumLineSpacing = 5;
    self.smallLayout.minimumInteritemSpacing = 5;
//    self.smallLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 25);
    
    self.collectionView.collectionViewLayout = self.flowLayout;
    
}


- (void)clickedPlay:(UIBarButtonItem*) button {
    
    UICollectionViewLayout *nextLayout;
    if (self.collectionView.collectionViewLayout == self.flowLayout) {
        nextLayout = self.smallLayout;
    } else {
        nextLayout = self.flowLayout;
    }
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView setCollectionViewLayout:nextLayout animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    UILabel *label = (UILabel*)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%ld/%ld", (long)indexPath.section, (long)indexPath.item];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        headerView.sectionLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
        return headerView;
    }
    return nil;
}


@end
