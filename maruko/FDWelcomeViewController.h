//
//  FDLoginViewController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"

typedef enum : NSUInteger {
    FDWelcomeActionTypeLogin,
    FDWelcomeActionTypeRegister,
    FDWelcomeActionTypeForget,
} FDWelcomeActionType;

@interface FDWelcomeViewController : FDBaseViewController

@end
