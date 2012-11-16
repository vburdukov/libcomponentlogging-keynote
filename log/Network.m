//
//  Network.m
//  log
//
//  Created by Vladimir Burdukov on 11/16/12.
//  Copyright (c) 2012 Vladimir Burdukov. All rights reserved.
//

#import "Network.h"

@interface Network ()
{
    dispatch_queue_t queue;
}

@end

@implementation Network

+ (id)sharedInstance
{
    static Network *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Network alloc] init];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        queue = dispatch_queue_create("my.test.logging", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)addDownloadingBlock:(void (^)(void))block
{
    dispatch_async(queue, block);
}

@end
