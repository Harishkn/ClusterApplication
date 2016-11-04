//
//  ViewController.m
//  ClusterApp
//
//  Created by test on 11/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UIImageView *sliderImage;
@property (weak, nonatomic) IBOutlet UIButton *joinUsoutLet;
@property (weak, nonatomic) IBOutlet UIButton *loginOutLet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.logoImage.layer.cornerRadius=50;
    self.secondView.layer.cornerRadius=10;
    self.sliderImage.layer.cornerRadius=10;
    self.loginOutLet.layer.cornerRadius=5;
    self.joinUsoutLet.layer.cornerRadius=5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
