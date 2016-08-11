//
//  SecViewController.h
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^sendeDara)(NSString * str);
@interface SecViewController : UIViewController

@property (nonatomic, copy) sendeDara  sendeBlock;

@end
