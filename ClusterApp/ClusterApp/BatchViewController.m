//
//  BatchViewController.m
//  ClusterApp
//
//  Created by test on 11/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "BatchViewController.h"

@interface BatchViewController ()
@property(strong,nonatomic)NSArray* java;
@property(strong,nonatomic)NSArray* ios;
@property(strong,nonatomic)NSArray* android;
@property(strong,nonatomic)NSArray* c;

@end

@implementation BatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.java = @[@"java Batch1",@"java Batch2",@"java Batch3"];
    
    self.ios = @[@"ios Batch1",@"ios Batch2",@"ios Batch3"];
    
   self.android = @[@"androi Batc1",@"android Batc2",@"android Batc3"];
    
    self.c = @[@"c Batc1",@"c Batc2",@"c Batc3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return self.java.count;
    }
    else if (section==1)
    {
        return self.ios.count;
    }
    else if (section==2)
    {
        return self.android.count;
    }
    else
    {
        return self.c.count;
    }
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (indexPath.section==0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.java[indexPath.row]];
        return cell;
    }
    else if (indexPath.section==1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.ios[indexPath.row]];
        return cell;
    }
    else if (indexPath.section==2)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.android[indexPath.row]];
        return cell;
    }
    else if (indexPath.section==3)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.c[indexPath.row]];
        return cell;
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return
        
        @"JAVA";
    }
    else if (section==1)
    {
        return @"IOS";
    }
    else if (section==2)
    {
        return @"Android";
    }
    else
    {
        return @"C";
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
