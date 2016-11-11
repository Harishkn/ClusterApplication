//
//  AboutUsViewController.m
//  ClusterApp
//
//  Created by test on 11/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "AboutUsViewController.h"
#import "AboutCollectionViewCell.h"

@interface AboutUsViewController ()
@property(strong,nonatomic)NSArray* imageNames;
@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.imageNames = @[@"1",@"2",@"3",@"4",@"5",@"6"];
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
    return self.imageNames.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AboutCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.displayImage.image = [UIImage imageNamed:self.imageNames[indexPath.row]];
    
    
    return cell;
}

@end
