//
//  HPProxy.h
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPProxy : NSProxy

+ (instancetype)proxyWithTransformObject:(id)object;

@end

NS_ASSUME_NONNULL_END
