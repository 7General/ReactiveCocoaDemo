//
//  TextView.h
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^reduceChange)(NSString * usermes,NSString * pwdStr);

@interface TextView : UIView

@property (nonatomic, copy) reduceChange  reduceBlock;




@end
