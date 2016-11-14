//
//  WelcomeViewController.m
//  ClusterApp
//
//  Created by test on 11/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "WelcomeViewController.h"
#import "HomeCollectionViewCell.h"

@interface WelcomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property(strong,nonatomic)NSArray* imageList;
@property(strong,nonatomic)NSArray* imageNames;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageList = @[@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19"];
    self.imageNames = @[@"Search",@"Notification",@"Resume",@"MockTest",@"Groups",@"Profile",@"Notes",@"Refer",@"Help"];
    
    self.logoImage.layer.cornerRadius=40;
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
    return self.imageList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.displayImage.image = [UIImage imageNamed:self.imageList[indexPath.row]];
    
    cell.imageNamesLabel.text = [NSString stringWithFormat:@"%@",self.imageNames[indexPath.row]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:[self.imageNames objectAtIndex:indexPath.row] sender:self];
    
    
    
   
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"show"])
//    {
//        
//    3
//}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int numberOfCellInRow = 4;
    CGFloat cellWidth =  [[UIScreen mainScreen] bounds].size.width/numberOfCellInRow;
    return CGSizeMake(cellWidth, cellWidth);
}
@end
