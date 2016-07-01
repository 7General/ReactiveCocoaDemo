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

@interface MainViewController ()

@property (nonatomic, weak) UITextField * userNameFiled;
@property (nonatomic, weak) UITextField * userPwdFiled;

@property (nonatomic, weak) UIButton * submitButton;


//@property (nonatomic, strong) ReactiveVIiewModel * ReactiveVM;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initReactiviewClick];
//    self.ReactiveVM = [[ReactiveVIiewModel alloc] init];
}
-(void)initView {
    UITextField * userNameFiled = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    userNameFiled.borderStyle = UITextBorderStyleRoundedRect;
//    userNameFiled.enabled = NO;
    //    [userNameFiled addTarget:self action:@selector(test) forControlEvents:UIControlEventEditingChanged];
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
    
    
    ReactiveVIiewModel * vm = [[ReactiveVIiewModel alloc] init];
    [vm testUserName:@"1" ages:@"2"];
    [vm setReduceBlock:^BOOL(NSString *usermes, NSString *pwdStr) {
        NSLog(@"------%@",usermes);
        return YES;
    }];
    
}
-(void)test {
    NSLog(@"=====");
}

-(void)initReactiviewClick1 {

//    RACSignal * updateTextSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        NSLog(@"----length%ld",value.length);
//        return (value.length <= 3)? @(YES):@(NO);
//    }];
    
//    RACSignal * updateTextSignal = [self.userNameFiled.rac_textSignal filter:^BOOL(NSString * value) {
//       return value.length <= 3 ? @(YES):@(NO);
//    }];
    
    
//    [self.userNameFiled.rac_textSignal filter:^BOOL(NSString * value) {
//        NSLog(@"-----%@",value);
//        return value;
//    }];
    
    
    
//    [[self.userNameFiled.rac_textSignal filter:^BOOL(NSString * value) {
//        NSLog(@"------%@",value);
//        return  value; //value.length >= 3 ? @(YES) : @(NO);
//    }] map:^id(NSString * value) {
//        NSLog(@"------%@",value);
//        return value;
//    }];
    
    
    
    
//    
//    RAC(self.userNameFiled,backgroundColor) = [updateTextSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor clearColor]:[UIColor redColor];
//    }];
//    
//    
//    RACSignal * updatePwdSignal = [self.userPwdFiled.rac_textSignal map:^id(NSString * value) {
//        return (value.length <= 6) ? @(YES):@(NO);
//    }];
    //RAC(self.userPwdFiled,enabled) = updatePwdSignal;
//    [updateTextSignal subscribeNext:^(NSNumber * value) {
//        self.userNameFiled.enabled = [value boolValue];
//    }];
//    RAC(self.userNameFiled,enabled) = [updateTextSignal map:^id(NSNumber * value) {
//        return @([value boolValue]);
//    }];
//    RAC(self.userPwdFiled,backgroundColor) = [updatePwdSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor clearColor]:[UIColor redColor];
//    }];
//    
//    RACSignal * fallInSignal = [RACSignal combineLatest:@[
//                                                          self.userNameFiled.rac_textSignal,
//                                                          self.userPwdFiled.rac_textSignal
//                                                          ]
//                                                 reduce:^(NSString * userName,NSString * pwd) {
//                                                     return  @(userName.length > 0 && pwd.length > 0);
//    }];
//    
//    RAC(self.submitButton,enabled) = fallInSignal;

}




-(void)initReactiviewClick {
    
    
    //[ReactiveVIiewModel subscribeNext:self.userNameFiled];
    
    //[ReactiveVIiewModel subscribeUpdate:self.userNameFiled EndIndex:4];
    
    //[ReactiveVIiewModel subscrInputCharLength:self.userNameFiled];
    
  
    [ReactiveVIiewModel racsignalcombineLatest:@[
                                                 self.userNameFiled.rac_textSignal,
                                                 self.userPwdFiled.rac_textSignal
                                                 ] toChangeButton:self.submitButton];
    
    //    vm.reduceBlock = ^(NSString * s1,NSString * s2) {
//       [vm testUserName:@"1" ages:@"2"];
//    };

    /**编写信号发送*/
//    RACSignal * userNameSignal = [self.userNameFiled.rac_textSignal map:^id(NSString * value) {
//        return @([self isValidString:value]);
//    }];
//    RACSignal * userPwdSignal = [self.userPwdFiled.rac_textSignal map:^id(NSString * value) {
//        return @([self isValidString:value]);
//    }];
    
    
    
//    RAC(self.userNameFiled,backgroundColor) = [userNameSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor redColor]:[UIColor yellowColor];
//    }];
//    
//    RAC(self.userPwdFiled,backgroundColor) = [userPwdSignal map:^id(NSNumber * value) {
//        return [value boolValue] ? [UIColor redColor]:[UIColor yellowColor];
//    }];
    
    
    /**聚合信号*/
//    RACSignal * singUpActiveSignal = [RACSignal combineLatest:@[userNameSignal,userPwdSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid) {
//        return @([usernameValid boolValue]&&[passwordValid boolValue]);
//    }];
//    [singUpActiveSignal subscribeNext:^(NSNumber * signupActive) {
//        self.submitButton.enabled = [signupActive boolValue];
//    }];
    
    
   
//    RACSignal *formValid = [RACSignal
//                            combineLatest:@[
//                                            self.userNameFiled.rac_textSignal,
//                                            self.userPwdFiled.rac_textSignal,
//                                            ]
//                            reduce:^(NSString *username, NSString *userPwdFiled) {
//                                return @([username length] > 0 && [userPwdFiled length] > 0);
//                            }];
//    
//    RAC(self.submitButton,enabled) = formValid;
    
    
    
}



- (BOOL)isValidString:(NSString *)password {
    return password.length > 3;
}

@end
