//
//  PockerView.h
//  翻牌
//
//  Created by 斌 on 2017/4/20.
//  Copyright © 2017年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PockerView : UIView

@property(nonatomic,strong)UIImageView *imgview1;
@property(nonatomic,strong)UIImageView *imgview2;

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;

@end
