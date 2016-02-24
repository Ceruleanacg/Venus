//
//  FDDateFormatter.h
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDDateFormatter : NSObject

+ (NSDate *)dateFromString:(NSString *)dateString;

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)stringFromValue:(NSString *)value;

+ (NSDateComponents *)dateComponentsFromDate:(NSDate *)date;

@end
