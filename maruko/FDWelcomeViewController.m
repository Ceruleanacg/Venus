//
//  FDLoginViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDWelcomeViewController.h"
#import "FDTriangleView.h"

#import "FDAccountService.h"

@implementation FDWelcomeViewController {
    UIView *_contentView;
    
    UIImageView *_topView;
    UIView *_downView;
    
    UIImageView *_logoView;
    
    UILabel *_topLabel;
    UILabel *_loginLabel;
    UILabel *_signupLabel;
    
    UILabel *_noticeLabel;
    
    UITextField *_usernameField;
    UITextField *_passwordField;
    UITextField *_smsCodeField;
    
    UIView *_firstLine;
    UIView *_secondLine;
    UIView *_thirdLine;
    
    FDButton *_forgetButton;
    FDButton *_smsCodeButton;
    
    FDTriangleView *_triangleView;
    
    FDWelcomeActionType _actionType;
    
    BOOL _isTyping;
    
    NSTimer *_smsCodeTimer;
    
    NSInteger _smsCodeCountTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self setupViews];
    
    [self hideSMSCodeField];
    
    _smsCodeCountTime = 60;
    
    _smsCodeTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_smsCodeTimer forMode:NSRunLoopCommonModes];
    
    [_smsCodeTimer setFireDate:[NSDate distantFuture]];
}

- (void)setupViews {
    
    _contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    _contentView.backgroundColor = ColorNormalBGWhite;
    
    _topView = [[UIImageView alloc] initWithImage:FDImageWithName(@"Main_Welcome")];
    _topView.userInteractionEnabled = YES;
    
    _downView = [UIView new];
    _downView.backgroundColor = ColorNormalBGWhite;
    
    _topLabel    = [UILabel labelWithText:@"欢迎使用优印校园客户端" Color:nil FontSize:18 Alignment:NSTextAlignmentCenter];
    
    WeakSelf;
    
    _logoView = [[UIImageView alloc] initWithImage:FDImageWithName(@"Main_Logo")];
    
    _loginLabel  = [UILabel labelWithText:@"登录" Color:nil FontSize:14 Alignment:NSTextAlignmentCenter];
    _loginLabel.userInteractionEnabled = YES;
    _loginLabel.tapAction = ^(UIView *view) {
        
        StrongSelf;
        
        [s_self hideSMSCodeField];
        [s_self leftTriangle];
    };
    
    _signupLabel = [UILabel labelWithText:@"注册" Color:nil FontSize:14 Alignment:NSTextAlignmentCenter];
    _signupLabel.userInteractionEnabled = YES;
    _signupLabel.tapAction = ^(UIView *view) {
        
        StrongSelf;
        
        [s_self showSMSCodeField];
        [s_self rightTriangle];
    };
    
    _triangleView = [[FDTriangleView alloc] init];
    
    _usernameField = [UITextField new];
    _usernameField.keyboardType  = UIKeyboardTypeNumberPad;
    _usernameField.returnKeyType = UIReturnKeyNext;
    _usernameField.attributedPlaceholder = [NSAttributedString attributedStringWithString:@"手机号码" Color:ColorCellPlaceholder];
    _usernameField.beginAction = ^(NSString *text, UITextField *textField) {
        
        StrongSelf;
        
        [s_self moveViewHigher];
    };
    _usernameField.doneAction  = ^(NSString *text, UITextField *textField) {
        
        StrongSelf;
        
        [s_self->_usernameField resignFirstResponder];
        [s_self->_passwordField becomeFirstResponder];
    };
    
    _passwordField = [UITextField new];
    _passwordField.secureTextEntry = YES;
    _passwordField.returnKeyType   = UIReturnKeyDone;
    _passwordField.attributedPlaceholder = [NSAttributedString attributedStringWithString:@"密码" Color:ColorCellPlaceholder];
    _passwordField.doneAction = ^(NSString *text, UITextField *textField) {
        
        StrongSelf;
        
        if (s_self->_actionType == FDWelcomeActionTypeLogin) {
            
            [s_self moveViewLower];
            
            NSString *username = s_self->_usernameField.text;
            NSString *password = s_self->_passwordField.text;
            
            if ([FDValidater validateMobile:username] && [FDValidater validatePassword:password]) {
                
                NSDictionary *parms = @{@"username" : username,
                                        @"password" : password};
                
                [FDAccountService loginWithParms:parms Callback:^(BOOL success) {
                    if (success) {
                        [s_self dismissViewControllerAnimated:YES completion:nil];
                    }
                }];
            } else {
                [FDAlert alertWithTitle:@"错误" Message:@"用户名或密码不合法"];
            }
        } else {
            // 注册 或者 忘记密码
            [s_self->_passwordField resignFirstResponder];
            [s_self->_smsCodeField  becomeFirstResponder];
        }
    };
    
    _forgetButton = [FDButton buttonWithType:UIButtonTypeSystem Title:@"忘记密码" FontSize:16 ActionBlock:^(FDButton *button) {
        
        StrongSelf;
        
        [s_self showSMSCodeField];
        
        s_self->_actionType = FDWelcomeActionTypeForget;
    }];
    
    _smsCodeField = [UITextField new];
    _smsCodeField.keyboardType  = UIKeyboardTypeAlphabet;
    _smsCodeField.returnKeyType = UIReturnKeyDone;
    _smsCodeField.attributedPlaceholder  = [NSAttributedString attributedStringWithString:@"短信验证码" Color:ColorWelcomeTextPlaceholer];
    _smsCodeField.doneAction = ^(NSString *text, UITextField *textField) {
        
        StrongSelf;
        
        if ([s_self checkIfTextLegal] && [s_self checkIfSMSCodeLegal]) {
            
            NSString *username = s_self->_usernameField.text;
            NSString *password = s_self->_passwordField.text;
            NSString *smsCode  = s_self->_smsCodeField.text;
            
            NSDictionary *parms = @{@"username" : username,
                                    @"password" : [FDCoding md5:password],
                                    @"smsCode"  : smsCode};
            
            if (s_self->_actionType == FDWelcomeActionTypeRegister) {
                
            } else {
                
                [FDAccountService forgetPasswordWithParms:parms Callback:^(BOOL success) {
                    if (success) {
                        [s_self hideSMSCodeField];
                    }
                }];
            }
        }
    };
    
    _smsCodeButton = [FDButton buttonWithType:UIButtonTypeCustom Title:@"获取验证码" FontSize:16 ActionBlock:^(FDButton *button) {
        
        StrongSelf;
        
        if ([s_self checkIfTextLegal]) {
            
            NSString *username = s_self->_usernameField.text;
            
            NSDictionary *parms = @{@"username" : username};
            
            [FDAccountService getSMSCodeWithParms:parms Callback:^(BOOL success) {
                if (success) {
                    [s_self->_smsCodeButton setEnabled:NO];
                    [s_self->_smsCodeTimer setFireDate:[NSDate date]];
                }
            }];
        }
        
    }];
    
    _firstLine = [UIView new];
    _firstLine.backgroundColor = ColorWelcomeTextPlaceholer;
    
    _secondLine = [UIView new];
    _secondLine.backgroundColor = ColorWelcomeTextPlaceholer;
    
    _thirdLine = [UIView new];
    _thirdLine.backgroundColor = ColorWelcomeTextPlaceholer;
    
    _noticeLabel = [UILabel labelWithText:@"登录或注册表示您同意我们的用户服务协议"
                                    Color:ColorWelcomeLabel
                                 FontSize:12
                                Alignment:NSTextAlignmentCenter];
    
    [self layoutViews];
}

- (void)layoutViews {
    
    [self.view addSubview:_contentView];
    
    [_contentView addSubview:_topView];
    [_contentView addSubview:_downView];
    
    [_topView addSubview:_logoView];
    [_topView addSubview:_topLabel];
    [_topView addSubview:_loginLabel];
    [_topView addSubview:_signupLabel];
    [_topView addSubview:_triangleView];
    
    [_downView addSubview:_usernameField];
    [_downView addSubview:_passwordField];
    [_downView addSubview:_forgetButton];
    [_downView addSubview:_smsCodeField];
    [_downView addSubview:_smsCodeButton];
    [_downView addSubview:_firstLine];
    [_downView addSubview:_secondLine];
    [_downView addSubview:_thirdLine];
    
    [_downView addSubview:_noticeLabel];
    
    _topView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 2);
    _downView.frame = CGRectMake(0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, SCREEN_HEIGHT / 2);
    
    [_topView addSubview:_triangleView];
    
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@(-30));
        make.size.mas_equalTo(CGSizeMake(130, 130));
    }];
    
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(_logoView.mas_bottom).offset(30);
    }];
    
    [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLabel);
        make.bottom.equalTo(@(-5));
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
    [_signupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_topLabel);
        make.bottom.equalTo(@(-5));
        make.size.mas_equalTo(_loginLabel);
    }];
    
    [_triangleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_loginLabel);
        make.bottom.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(12, 8));
    }];
    
    [_usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
    }];
    
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameField.mas_bottom).offset(30);
        make.left.equalTo(_usernameField);
        make.width.equalTo(@200);
    }];
    
    [_forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_passwordField);
        make.right.equalTo(_firstLine);
    }];
    
    [_smsCodeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordField.mas_bottom).offset(30);
        make.left.right.equalTo(_passwordField);
    }];
    
    [_smsCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_smsCodeField);
        make.right.equalTo(_firstLine);
    }];
    
    [_firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameField.mas_bottom).offset(10);
        make.left.right.equalTo(_usernameField);
        make.height.equalTo(@0.5);
    }];
    
    [_secondLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordField.mas_bottom).offset(10);
        make.left.right.equalTo(_usernameField);
        make.height.equalTo(_firstLine);
    }];
    
    [_thirdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_smsCodeField.mas_bottom).offset(10);
        make.left.right.equalTo(_usernameField);
        make.height.equalTo(_firstLine);
    }];
    
    [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-20));
        make.centerX.equalTo(@0);
    }];
}

- (void)leftTriangle {
    [_triangleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_loginLabel);
        make.bottom.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(12, 8));
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [_topView layoutIfNeeded];
    }];
}

- (void)rightTriangle {
    [_triangleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_signupLabel);
        make.bottom.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(12, 8));
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [_topView layoutIfNeeded];
    }];
}

- (void)showSMSCodeField {
    
    _actionType = FDWelcomeActionTypeRegister;
    
    _passwordField.returnKeyType = UIReturnKeyNext;
    
    WeakSelf;
    
    [self.view animationWithDuration:0.25 animations:^{
        
        StrongSelf;
        
        s_self->_smsCodeField.alpha  = 1.0;
        s_self->_thirdLine.alpha     = 1.0;
        s_self->_loginLabel.alpha    = 0.75;
        s_self->_signupLabel.alpha   = 1.0;
        s_self->_forgetButton.alpha  = 0.0;
        s_self->_smsCodeButton.alpha = 1.0;
    }];
}

- (void)hideSMSCodeField {
    
    _actionType = FDWelcomeActionTypeLogin;
    
    _passwordField.returnKeyType = UIReturnKeyDone;
    
    [_smsCodeField resignFirstResponder];
    
    WeakSelf;
    
    [self.view animationWithDuration:0.25 animations:^{
        
        StrongSelf;
        
        s_self->_smsCodeField.alpha  = 0.0;
        s_self->_thirdLine.alpha     = 0.0;
        s_self->_loginLabel.alpha    = 1.0;
        s_self->_signupLabel.alpha   = 0.75;
        s_self->_forgetButton.alpha  = 1.0;
        s_self->_smsCodeButton.alpha = 0.0;
    }];
}

- (void)moveViewHigher {
    if (_isTyping) {
        return;
    }
    
    _isTyping = YES;
    
    CGRect rect = _contentView.frame;
    rect.origin.y -= 100;
    
    [UIView animateWithDuration:0.25 animations:^{
        _contentView.frame = rect;
    }];
}

- (void)moveViewLower {
    if (!_isTyping) {
        return;
    }
    
    _isTyping = NO;
    
    CGRect rect = _contentView.frame;
    rect.origin.y += 100;
    
    [UIView animateWithDuration:0.25 animations:^{
        _contentView.frame = rect;
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Helper Method

- (BOOL)checkIfTextLegal {
    
    if (![FDValidater validatePassword:_passwordField.text]) {
        [FDAlert alertWithTitle:@"错误" Message:@"密码长度不合法"];
        return NO;
    }
    
    if (![FDValidater validateMobile:_usernameField.text]) {
        [FDAlert alertWithTitle:@"错误" Message:@"手机号码格式不合法"];
        return NO;
    }
    
    return YES;
}

- (BOOL)checkIfSMSCodeLegal {
    if (!_smsCodeField.text.length) {
        [FDAlert alertWithTitle:@"错误" Message:@"短信验证码不能为空"];
        return NO;
    }
    
    return YES;
}

- (void)timerAction:(NSTimer *)timer {
    if (_smsCodeCountTime >= 0) {
        [_smsCodeButton setTitle:[NSString stringWithFormat:@"重新获取(%ld)", (long)_smsCodeCountTime--] forState:UIControlStateNormal];
    } else {
        [_smsCodeTimer setFireDate:[NSDate distantFuture]];
        [_smsCodeButton setEnabled:YES];
        [_smsCodeButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        _smsCodeCountTime = 60;
    }
}


@end
