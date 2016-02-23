//
//  FDAlert.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDAlert.h"

@implementation FDAlert

+ (void)alertWithErrorCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"错误码:%ld", (long)errorCode]
                                                                             message:errorMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    
    [FDAlert showAlertController:alertController];
}

+ (void)alertWithTitle:(NSString *)title Message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"知道了"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    
    [alertController addAction:confirmAction];
    
    [FDAlert showAlertController:alertController];
}

+ (void)alertWithTitle:(NSString *)title Message:(NSString *)message Stressed:(BOOL)stressed confirmAction:(void (^)())action {
    UIAlertController *alertController = [FDAlert alertControllerWithTitle:title Message:message PreferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认"
                                                            style:stressed ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault
                                                          handler:action];
    
    UIAlertAction *cancelAction  = [UIAlertAction actionWithTitle:@"取消"
                                                            style:UIAlertActionStyleCancel
                                                          handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [FDAlert showAlertController:alertController];
}

+ (void)actionSheetWithTitle:(NSString *)title Message:(NSString *)message Stressed:(BOOL)stressed confirmAction:(void (^)())action {
    UIAlertController *alertController = [FDAlert alertControllerWithTitle:title Message:message PreferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认"
                                                            style:stressed ? UIAlertActionStyleDestructive : UIAlertActionStyleDefault
                                                          handler:action];
    
    UIAlertAction *cancelAction  = [UIAlertAction actionWithTitle:@"取消"
                                                            style:UIAlertActionStyleCancel
                                                          handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [FDAlert showAlertController:alertController];
}

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title Message:(NSString *)message  PreferredStyle:(UIAlertControllerStyle)preferredStyle {
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
}

+ (void)showAlertController:(UIAlertController *)controller {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    UIViewController *presentingViewController = nil;
    
    if ([[keyWindow rootViewController] presentedViewController]) {
        presentingViewController = [[keyWindow rootViewController] presentedViewController];
    } else {
        presentingViewController = [keyWindow rootViewController];
    }
    
    [presentingViewController presentViewController:controller animated:YES completion:nil];
}

@end
