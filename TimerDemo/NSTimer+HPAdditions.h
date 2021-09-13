//
//  NSTimer+HPAdditions.h
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (HPAdditions)

+ (NSTimer *)hp_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
