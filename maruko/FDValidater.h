//
//  FDValidater.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDValidater : NSObject

+ (BOOL)validateName:(NSString *)name;

+ (BOOL)validatePassword:(NSString *)password;

+ (BOOL)validateEmail:(NSString *)email;

+ (BOOL)validateMobile:(NSString *)mobile;

+ (BOOL)validateQQ:(NSString *)qq;

+ (BOOL)validateIdentityCard: (NSString *)identityCard;

@end
