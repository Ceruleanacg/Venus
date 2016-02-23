//
//  FDAlert.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FDAlert : NSObject

+ (void)alertWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage;

+ (void)alertWithTitle:(NSString *)title Message:(NSString *)message;

+ (void)alertWithTitle:(NSString *)title Message:(NSString *)message Stressed:(BOOL)stressed confirmAction:(void (^)())action;

+ (void)actionSheetWithTitle:(NSString *)title Message:(NSString *)message Stressed:(BOOL)stressed confirmAction:(void (^)())action;

@end
