//
//  Macro.h
//  jandan
//
//  Created by 代烁 on 2020/7/5.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>


#define ScreenSize [[UIScreen mainScreen]bounds].size
#define WIDTH  (ScreenSize.width > ScreenSize.height ? ScreenSize.height : ScreenSize.width)

