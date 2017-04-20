#import "ViewController.h"
#import "PockerView.h"
@interface ViewController ()
// 记录翻第几张牌
@property(nonatomic,assign)NSInteger index;
// 动画时间
@property(nonatomic,assign)CGFloat duration;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    _duration = 0.5;
    _index = 0;
    NSArray *arr = @[@"2.jpg",@"3.jpg",@"4.jpg"];
    // 循环创建3张扑克牌
    for (int i = 0; i < 3; i++) {
        PockerView *pocker = [[PockerView alloc]initWithFrame:CGRectMake(100 + 80 * i, 100, 100, 150) imageName:arr[i]];
        pocker.tag = 1000 + i;
        [self.view addSubview:pocker];
    }
}



// 点击空白处触发
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 执行动画
    [self executeAnimation];
}


// 执行动画
- (void)executeAnimation{
    // 根据tag值取到扑克牌
    PockerView *pocker = [self.view viewWithTag:1000+ _index];
    // 方法一
    [self animationWithView:pocker];
    // 方法二
//    [self rotateWithView:pocker];
}

// 翻牌动画方法一（内部实现还是方法二）
- (void)animationWithView:(PockerView *)view{
    // 延时方法 正在翻转的牌翻转一半的时候把它移到视图最上面来
    [self performSelector:@selector(delayAction:) withObject:view afterDelay:_duration / 2];
    
    // 翻转动画
    UIViewAnimationOptions option =  UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:view                      duration:_duration
                       options:option
                    animations:^ {
                        [view.imgview1 removeFromSuperview];
                        [view addSubview:view.imgview2];
                    }
                    completion:^(BOOL finished){
                        _index++;
                        if (_index < 3) {
                            [self executeAnimation];
                        }
    }];
}

// 延时方法
- (void)delayAction:(UIView *)view{
    [self.view bringSubviewToFront:view];
}


- (void)delayAction2{
    _index++;
    if (_index < 3) {
        [self executeAnimation];
    }
}


// 方法二
- (void)rotateWithView:(PockerView *)view{
    
    [self performSelector:@selector(delayAction:) withObject:view afterDelay:_duration / 2];
    [self performSelector:@selector(delayAction2) withObject:nil afterDelay:_duration];
    [UIView beginAnimations:@"aa" context:nil];
    [UIView setAnimationDuration:_duration];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [view.imgview1 removeFromSuperview];
    [view addSubview:view.imgview2];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:NO];
    [UIView commitAnimations];
}
@end
