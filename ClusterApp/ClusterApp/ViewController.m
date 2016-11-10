//
//  ViewController.m
//  ClusterApp
//
//  Created by test on 11/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h> 

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
    
    
    NSArray *imageNames = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
  
    self.sliderImage.animationImages = images;
    self.sliderImage.animationDuration = 10;
    
    //[self.view addSubview:animationImageView];
    [self.sliderImage startAnimating];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self runSpinAnimationOnView:self.logoImage duration:10 rotations:1 repeat:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 1.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
@end
