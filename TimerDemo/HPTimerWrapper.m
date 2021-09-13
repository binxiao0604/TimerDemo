//
//  HPTimerWrapper.m
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import "HPTimerWrapper.h"
#import <objc/message.h>

@interface HPTimerWrapper()

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL aSelector;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HPTimerWrapper

- (instancetype)hp_initWithTimeInterval:(NSTimeInterval)timeInterval target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    if (self == [super init]) {
        self.target = aTarget; // vc
        self.aSelector = aSelector; // 方法 -- vc 释放
        if ([self.target respondsToSelector:self.aSelector]) {
            //本类添加 aSelector
            Method method    = class_getInstanceMethod([self.target class], aSelector);
            const char *type = method_getTypeEncoding(method);
            class_addMethod([self class], aSelector, (IMP)timeActionWapper, type);
            //aSelector 是传递进来的。
            self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:aSelector userInfo:userInfo repeats:yesOrNo];
        }
    }
    return self;
}

//提供给外界主动调用 timer 释放
- (void)hp_invalidate {
    [self.timer invalidate];
    self.timer = nil;
}

void timeActionWapper(HPTimerWrapper *warpper) {
    //交给 target 自己处理 aSelector
    if (warpper.target) {
        void (*hp_msgSend)(void *,SEL, id) = (void *)objc_msgSend;
        hp_msgSend((__bridge void *)(warpper.target), warpper.aSelector,warpper.timer);
    } else { // warpper target 不存在，直接释放 timer
        [warpper hp_invalidate];
    }
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

@end
