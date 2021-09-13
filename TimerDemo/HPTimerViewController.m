//
//  HPTimerViewController.m
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import "HPTimerViewController.h"
#import "NSTimer+HPAdditions.h"
#import <objc/runtime.h>
#import "HPProxy.h"
#import "HPTimerWrapper.h"

static int num = 0;

@interface HPTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) id target;
@property (nonatomic, strong) HPProxy *proxy;
@property (nonatomic, strong) HPTimerWrapper *timerWapper;

@end

@implementation HPTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 系统API
    //1.1
//    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //1.2
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    //立即触发一次
//    [self.timer fire];
    
    //1.3
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        num++;
//        NSLog(@"timerAction: %d",num);
//    }];
    
    //2. 中介者
    //2.1
//    self.timer = [NSTimer hp_scheduledTimerWithTimeInterval:3.0 block:^{
//        num++;
//        NSLog(@"timerAction: %d",num);
//    } repeats:YES];
    
    //2.2
//    self.target = [[NSObject alloc] init];
//    class_addMethod([NSObject class], @selector(timerAction1), (IMP)timerActionFunc, "v@:");
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.target selector:@selector(timerAction1) userInfo:nil repeats:YES];
    
    //2.3
//    self.proxy = [HPProxy proxyWithTransformObject:self];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.proxy selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    //2.4
    self.timerWapper = [[HPTimerWrapper alloc] hp_initWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    NSLog(@"start");
}

void timerActionFunc(){
    num++;
    NSLog(@"timerActionFunc: %d",num);
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.timer invalidate];
//    self.timer = nil;
//}

//- (void)didMoveToParentViewController:(UIViewController *)parent {
//    if (parent == nil) {
//       [self.timer invalidate];
//        self.timer = nil;
//    }
//}

- (void)timerAction {
    num++;
    NSLog(@"timerAction: %d",num);
}

- (void)dealloc {
//    [self.timer invalidate];
//    self.timer = nil;
    NSLog(@"dealloc");
}

@end
