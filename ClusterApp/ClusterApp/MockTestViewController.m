//
//  MockTestViewController.m
//  ClusterApp
//
//  Created by test on 11/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "MockTestViewController.h"
#import "CollectionViewCell.h"

@interface MockTestViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic)NSArray* imageList;
@end

@implementation MockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.imageList = @[@"Android",@"Asp",@"C",@"iOS",@"Java",@"Selenium"];
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
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageDisplay.image = [UIImage imageNamed:self.imageList[indexPath.row]];

    
    
    
    
    return cell;
}
@end
