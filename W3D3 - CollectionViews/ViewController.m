//
//  ViewController.m
//  W3D3 - CollectionViews
//
//  Created by Daniel Mathews on 2015-09-09.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CustomCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic) UICollectionViewFlowLayout *smallLayout;
@property (nonatomic) UICollectionViewFlowLayout *largeLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.smallLayout = [[UICollectionViewFlowLayout alloc] init];
    self.smallLayout.itemSize = CGSizeMake(50, 50);
    self.smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.smallLayout.minimumInteritemSpacing = 5;
    self.smallLayout.minimumLineSpacing = 5;
    
    self.largeLayout = [[UICollectionViewFlowLayout alloc] init];
    self.largeLayout.itemSize = CGSizeMake(100, 100);
    self.largeLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.largeLayout.minimumInteritemSpacing = 15;
    self.largeLayout.minimumLineSpacing = 10;
    self.largeLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
    
    
    [self.collectionView setCollectionViewLayout:self.smallLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    cell.indexPathLabel.text = [NSString stringWithFormat:@"I:%ld", indexPath.item];
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionTitle" forIndexPath:indexPath ];
    
    view.sectionTitle.text = [NSString stringWithFormat:@"Section :%ld", indexPath.section];
    
    return view;
}

- (IBAction)barButtonPressed:(UIBarButtonItem *)sender {
    
//    UICollectionViewFlowLayout *next;
//    
//    if (self.collectionView.collectionViewLayout == self.largeLayout) {
//        next = self.smallLayout;
//    }else{
//        next = self.largeLayout;
//    }
    
    UICollectionViewFlowLayout *next = (self.collectionView.collectionViewLayout == self.largeLayout) ? self.smallLayout : self.largeLayout;
    
    
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView setCollectionViewLayout:next animated:YES];
    
}


@end
