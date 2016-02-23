//
//  FDBaseModel.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Mantle.h>

@interface FDBaseModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *objectID;

@end
