//
//  PockerView.m
//  翻牌
//
//  Created by 斌 on 2017/4/20.
//  Copyright © 2017年 斌. All rights reserved.
//

#import "PockerView.h"

@implementation PockerView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置阴影
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-10, 0);
        self.layer.shadowOpacity = 0.3;
        
        // 牌的背面
        self.imgview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imgview1.backgroundColor = [UIColor redColor];
        _imgview1.image = [UIImage imageNamed:@"1.jpeg"];
        [self addSubview:_imgview1];
        self.imgview1.layer.cornerRadius = 10;
        self.imgview1.clipsToBounds = YES;
        self.imgview1.layer.borderWidth = 5;
        self.imgview1.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        // 牌的正面
        self.imgview2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imgview2.backgroundColor = [UIColor redColor];
        _imgview2.image = [UIImage imageNamed:imageName];
        self.imgview2.layer.cornerRadius = 10;
        self.imgview2.clipsToBounds = YES;
        self.imgview2.layer.borderWidth = 5;
        self.imgview2.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return self;
}
@end
