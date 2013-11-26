//
//  PAKProtocols.h
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PAKSeqPacker <NSObject>

- (NSEnumerator*)pack;

@end

@protocol PAKSeqUnpacker <NSObject>

- (void)unpack:(NSEnumerator*)enumerator;

@end