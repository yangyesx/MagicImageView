//
//  ViewController.m
//  BigImageDemo
//
//  Created by yangyunen on 2017/7/20.
//  Copyright © 2017年 yangyunen. All rights reserved.
//

#import "ViewController.h"
#import "MagicImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *pic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicImageView *igv = [[MagicImageView alloc] initWithImage:[UIImage imageNamed:@"pic"]];
    igv.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:igv];
    
    MagicImageView *igv2 = [[MagicImageView alloc] initWithImage:[UIImage imageNamed:@"pic"]];
    igv2.frame = CGRectMake(10, 210, 300, 200);
    [self.view addSubview:igv2];
}

@end
