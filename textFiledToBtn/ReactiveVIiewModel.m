//
//  ReactiveVIiewModel.m
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//



#import "ReactiveVIiewModel.h"




@interface ReactiveVIiewModel()

@end


@implementation ReactiveVIiewModel

/**检测到用户输入过程*/
+(void)subscribeNext:(UITextField *)textFiled {
    [textFiled.rac_textSignal subscribeNext:^(NSString * value) {
        NSLog(@"---->>>%@",value);
    }];
}

/**监听只超过index个字符的数据*/
+(void)subscribeNext:(UITextField *)textFiled StartIndex:(NSInteger)index {
    [[textFiled.rac_textSignal filter:^BOOL(NSString * value) {
        return value.length > index;
    }] subscribeNext:^(id x) {
        NSLog(@"-----%@",x);
    }];
}

/**监听输入字符数，改变输入框的背景颜色,判断结束位置*/
+(void)subscribeUpdate:(UITextField *)textFiled EndIndex:(NSInteger)index {
    /**编写信号*/
    RACSignal * signal = [textFiled.rac_textSignal map:^id(NSString * value) {
        return value.length > index ? @(NO) : @(YES);
    }];
    
    RAC(textFiled,backgroundColor) = [signal map:^id(NSNumber * value) {
        return [value boolValue] ? [UIColor whiteColor] : [UIColor redColor];
    }];
    
}

/**监听输入字符创的长度*/
+(void)subscrInputCharLength:(UITextField *)textFiled {
    [[textFiled.rac_textSignal map:^id(NSString * value) {
        return @(value.length);
    }] subscribeNext:^(id x) {
        NSLog(@"---字符长度%@",x);
    }];
}
/*
 注意：在上面的text.length返回一个NSUInteger，是一个基本类型。为了将它作为事件的内容，NSUInteger必须被封装。幸运的是Objective-C literal syntax提供了一种简单的方法来封装——@ (text.length)。
 */


/*!
 *  监听UITextFiled的内容改变UIbutton的Eanble属性
 *
 *  @param obj    需要监听的UITextFiled的Rac信号
 *  @param button 需要改变的UIButton
 */
+(void)racsignalcombineLatest:(NSArray *)obj toChangeButton:(UIButton *)button {
    RACSignal * lcombineSignal = [RACSignal combineLatest:obj reduce:^(NSString * userName,NSString * pwdStr){
        return  @(userName.length > 0 && pwdStr.length > 0);
    }];
    RAC(button,enabled) = lcombineSignal;
    
}


-(void)testUserName:(NSString *)name  ages:(NSString *)ages{
    NSLog(@"1:>>>>>>%@----%@",name,ages);
   
    
}

-(void)setReduceBlock:(reduceChange)reduceBlock {
    _reduceBlock = [reduceBlock copy];

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
