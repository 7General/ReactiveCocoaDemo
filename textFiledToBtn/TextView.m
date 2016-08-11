//
//  TextView.m
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

//-(void)setReduceBlock:(reduceChange)reduceBlock {
//    _reduceBlock = reduceBlock;
//}

-(void)initView {

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
-(void)click:(UIButton *)sender {
    NSLog(@"11111------");
    if (self.reduceBlock) {
        self.reduceBlock(@"1",@"2");
    }

}
@end
