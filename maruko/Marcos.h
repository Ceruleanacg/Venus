//
//  Marcos.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#ifndef Marcos_h
#define Marcos_h

#define WeakSelf   __weak typeof(self) w_self = self

#define StrongSelf __strong typeof(w_self) s_self = w_self

#define DLogError(__ERROR__) if (__ERROR__) { NSLog(@"%@", __ERROR__); }

#define FDImageWithName(__IMAGE_NAME__) [UIImage imageNamed:__IMAGE_NAME__]

#endif /* Marcos_h */
