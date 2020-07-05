//
//  PictureModel.m
//  jandan
//
//  Created by 代烁 on 2020/7/5.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "PictureModel.h"
#import "ImageSizeWithUrl.h"
#import <UIKit/UIKit.h>
#import "Macro.h"
@implementation PictureModel


-(instancetype) fromUrl:(NSString *) url{
    
    if(self){
        self.url = url;
       CGSize size= [ImageSizeWithUrl getImageSize:url];
        
        
        NSInteger width = ScreenSize.width-10;
        NSInteger height = size.height*width/size.width;
        self.width = [NSNumber numberWithInteger:width];
        self.height = [NSNumber numberWithInteger:height];
    
        
    }
    
    return self;
    
    
}

@end
