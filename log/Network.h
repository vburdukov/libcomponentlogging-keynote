//
//  Network.h
//  log
//
//  Created by Vladimir Burdukov on 11/16/12.
//  Copyright (c) 2012 Vladimir Burdukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Network : NSObject

+ (id)sharedInstance;

- (void)addDownloadingBlock:(void (^)(void))block;

@end
