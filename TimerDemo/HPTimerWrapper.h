//
//  HPTimerWrapper.h
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPTimerWrapper : NSObject

- (instancetype)hp_initWithTimeInterval:(NSTimeInterval)timeInterval target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

- (void)hp_invalidate;

@end

NS_ASSUME_NONNULL_END
