//
//  FDCoding.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface FDCoding : NSObject

+ (NSString *) md5:(NSString *)str;

@end
