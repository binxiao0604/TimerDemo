//
//  NSTimer+HPAdditions.m
//  TimerDemo
//
//  Created by ZP on 2021/9/13.
//

#import "NSTimer+HPAdditions.h"

@implementation NSTimer (HPAdditions)

+ (NSTimer *)hp_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(hp_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)hp_blockInvoke:(NSTimer *)timer
{
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

- (void)dealloc {
    NSLog(@"timer dealloc");
}

@end
