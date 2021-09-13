//
//  HPProxy.m
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import "HPProxy.h"

@interface HPProxy()

@property (nonatomic, weak) id object;

@end


@implementation HPProxy

+ (instancetype)proxyWithTransformObject:(id)object {
    HPProxy *proxy = [HPProxy alloc];
    proxy.object = object;
    return proxy;
}

//方式一：备用消息接收者（消息快速转发）
//为了保证中间件能够响应外部self的事件，需要通过消息转发机制，让实际的响应target还是外部self。
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.object;
}

////方式二：慢速消息转发
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
//
//    if (!self.object) {
//        NSLog(@"error");
//    }
//    return [self.object methodSignatureForSelector:sel];
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation {
//
//    if (self.object) {
//        [invocation invokeWithTarget:self.object];
//    } else {
//        NSLog(@"error");
//    }
//}

@end
