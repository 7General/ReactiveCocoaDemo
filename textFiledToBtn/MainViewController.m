//
//  MainViewController.m
//  textFiledToBtn
//
//  Created by 王会洲 on 16/7/1.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ReactiveVIiewModel.h"
#import "TextView.h"
#import "SecViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) UITextField * userNameFiled;
@property (nonatomic, weak) UITextField * userPwdFiled;

@property (nonatomic, weak) UIButton * submitButton;


@property (nonatomic, strong) ReactiveVIiewModel * ReactiveVM;

@property (nonatomic, strong) TextView * tv;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initReactiviewClick1];
}
-(void)initView {
    UITextField * userNameFiled = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    userNameFiled.borderStyle = UITextBorderStyleRoundedRect;
    userNameFiled.placeholder = @"用户名";
    [self.view addSubview:userNameFiled];
    self.userNameFiled = userNameFiled;
    
    UITextField * userPwdFiled = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    userPwdFiled.borderStyle = UITextBorderStyleRoundedRect;
    userPwdFiled.placeholder = @"密码";
    [self.view addSubview:userPwdFiled];
    self.userPwdFiled = userPwdFiled;
    
    
    
    UIButton * submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(50, 260, 200, 50);
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton setBackgroundImage:[UIImage imageNamed:@"login_normal"] forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    self.submitButton = submitButton;
    
}

-(void)clickAction:(UIButton *)sender {
    [self test];
    SecViewController * sec = [[SecViewController alloc] init];
    sec.sendeBlock = ^(NSString * str ){
        NSLog(@"--BLOCK-----%@",str);
    };
   
    [self.navigationController pushViewController:sec animated:YES];
    
    
}
-(void)test {
    NSLog(@"=====");
}

-(void)ReactiveCocoaClick {
    RACSubject * letters = [RACSubject subject];
//    RACSubject * numbers = [RACSubject subject];
//    RACSignal * merged = [RACSignal merge:@[letters,numbers]];
//    [merged subscribeNext:^(id x) {
//        NSLog(@"------%@", x);
//    }];
    
    [letters subscribeNext:^(id x) {
        NSLog(@"------%@", x);
    }];
    
    
    [letters sendNext:@"ddd"];
    [letters sendNext:@"金军"];
    [letters sendNext:@"几天几夜"];
    
    
}


-(void)initReactiviewClick1 {
/**监听输入字符*/
//    [self.userNameFiled.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"----%@",x);
//    }];
    /**监听输入N个字符以后的动作*/
//    [[self.userNameFiled.rac_textSignal filter:^BOOL(NSString * value) {
//        return value.length > 6;
//    }] subscribeNext:^(NSString * value) {
//        NSLog(@"----%@",value);
//    }];
//    
//    // 这样写不好啊
//    [[self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        return value.length > 6 ? value : @"";
//    }] subscribeNext:^(NSString * value) {
//        NSLog(@"----%@",value);
//    }];
//    
    
    
    /**监听数据输入控制按钮的点击状态*/
//    RACSignal * updateTextSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        NSLog(@"----length%ld",value.length);
//        return (value.length <= 3)? @(NO):@(YES);
//    }];
//    RAC(self.submitButton,enabled) = updateTextSignal;
//    // 也可以这样写
//    [updateTextSignal subscribeNext:^(NSNumber * value) {
//        self.submitButton.enabled = [value boolValue];
//    }];

    
    
//    
//    [[[self.userNameFiled.rac_textSignal filter:^BOOL(NSString * value) {
//        NSLog(@"--1----%@",value);
//        return  value; //value.length >= 3 ? @(YES) : @(NO);
//    }] map:^id(NSString * value) {
//        NSLog(@"--2----%@",value);
//        return value;
//    }] subscribeNext:^(NSString * x) {
//        NSLog(@"--3----%@",x);
//    }];
    
    
    /**监听文字输入，改变文本框背景的输入颜色*/
//    RACSignal * updateTextSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        NSLog(@"----length%ld",value.length);
//        return (value.length <= 3)? @(NO):@(YES);
//    }];
//    
//    RAC(self.userNameFiled,backgroundColor) = [updateTextSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor clearColor]:[UIColor redColor];
//    }];
    
    
//    RACSignal * updateTextSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        NSLog(@"----length%ld",value.length);
//        return (value.length <= 3)? [UIColor clearColor]:[UIColor redColor];
//    }];
//    RAC(self.userNameFiled,backgroundColor) = updateTextSignal;
//    /**还可以这样写*/
//    [updateTextSignal subscribeNext:^(id x) {
//        self.userNameFiled.backgroundColor = x;
//    }];
    
    
    

    
    /**监听输入文字长度，改变文本框的enabled属性*/
//    RACSignal * updatePwdSignal = [self.userPwdFiled.rac_textSignal map:^id(NSString * value) {
//        return (value.length <= 6) ? @(YES):@(NO);
//    }];
//    RAC(self.userPwdFiled,enabled) = updatePwdSignal;
//    [updatePwdSignal subscribeNext:^(NSNumber * value) {
//        self.userPwdFiled.enabled = [value boolValue];
//    }];
    
    
//    RACSignal * updatePwdSignal = [self.userPwdFiled.rac_textSignal filter:^BOOL(NSString * value) {
//        return (value.length <= 6) ? @(YES):@(YES);
//    }];
//    RAC(self.userPwdFiled,enabled) = updatePwdSignal;
//    [updatePwdSignal subscribeNext:^(NSString * value) {
//        NSLog(@"-----%@",value);
//    }];
    

    
    
    /**监听多个输入文本框，同时控制控件属性*/
    RACSignal * fallInSignal = [RACSignal combineLatest:@[
                                                          self.userNameFiled.rac_textSignal,
                                                          self.userPwdFiled.rac_textSignal
                                                          ]
                                                 reduce:^(NSString * userName,NSString * pwd) {
                                                     return  @(userName.length > 0 && pwd.length > 0);
    }];
    
    RAC(self.submitButton,enabled) = fallInSignal;

}




-(void)initReactiviewClick {
    self.tv.reduceBlock = ^BOOL(NSString *usermes, NSString *pwdStr) {
        NSLog(@"Block----222222222222");
        return YES;
    };
    
    //[ReactiveVIiewModel subscribeNext:self.userNameFiled];
    
    //[ReactiveVIiewModel subscribeUpdate:self.userNameFiled EndIndex:4];
    
    //[ReactiveVIiewModel subscrInputCharLength:self.userNameFiled];
    
  
//    [ReactiveVIiewModel racsignalcombineLatest:@[
//                                                 self.userNameFiled.rac_textSignal,
//                                                 self.userPwdFiled.rac_textSignal
//                                                 ] toChangeButton:self.submitButton];
  

    /**编写信号发送*/
    RACSignal * userNameSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
        return @([self isValidString:value]);
    }];
    RACSignal * userPwdSignal = [self.userPwdFiled.rac_textSignal map:^id(NSString * value) {
        return @([self isValidString:value]);
    }];
    
    
    
//    RAC(self.userNameFiled,backgroundColor) = [userNameSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor redColor]:[UIColor yellowColor];
//    }];
//    
//    RAC(self.userPwdFiled,backgroundColor) = [userPwdSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor redColor]:[UIColor yellowColor];
//    }];
    
    
    /**聚合信号*/
    RACSignal * singUpActiveSignal = [RACSignal combineLatest:@[userNameSignal,userPwdSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid) {
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }];
    [singUpActiveSignal subscribeNext:^(NSNumber * signupActive) {
        self.submitButton.enabled = [signupActive boolValue];
    }];
    
    
   
//    RACSignal *formValid = [RACSignal
//                            combineLatest:@[
//     -                                       self.userNameFiled.rac_textSignal,
//                                            self.userPwdFiled.rac_textSignal,
//                                            ]
//                            reduce:^(NSString *username, NSString *userPwdFiled) {
//                                return @([username length] > 0 && [userPwdFiled length] > 0);
//                            }];
//    
//    RAC(self.submitButton,enabled) = formValid;
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL)isValidString:(NSString *)password {
    return password.length > 3;
}

@end
