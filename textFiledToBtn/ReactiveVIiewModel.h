//
//  ReactiveVIiewModel.h
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

typedef BOOL(^reduceChange)(NSString * usermes,NSString * pwdStr);



@interface ReactiveVIiewModel : NSObject

@property (nonatomic, copy) reduceChange  reduceBlock;



/**检测到用户输入过程*/
+(void)subscribeNext:(UITextField *)textFiled;

/**监听只超过index个字符的数据*/
+(void)subscribeNext:(UITextField *)textFiled StartIndex:(NSInteger)index;

/**监听输入字符数，改变输入框的背景颜色,判断结束位置*/
+(void)subscribeUpdate:(UITextField *)textFiled EndIndex:(NSInteger)index;

/**监听输入字符创的长度*/
+(void)subscrInputCharLength:(UITextField *)textFiled;

/*!
 *  监听UITextFiled的内容改变UIbutton的Eanble属性
 *  根据具体情况具体修改形参（reduce-BLOCK）
 *
 *  @param obj    需要监听的UITextFiled的Rac信号
 *  @param button 需要改变的UIButton
 */
+(void)racsignalcombineLatest:(NSArray *)obj toChangeButton:(UIButton *)button;

-(void)testUserName:(NSString *)name  ages:(NSString *)ages;

-(void)setReduceBlock:(reduceChange)reduceBlock;

@end
