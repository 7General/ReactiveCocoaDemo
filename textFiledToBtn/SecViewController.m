//
//  SecViewController.m
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}
-(void)initView {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 100, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)click:(UIButton *)sender {
    NSLog(@"11111------");
    if (self.sendeBlock) {
        self.sendeBlock(@"1mmmmmmmmmmmmmm");
    }
    
}

@end
