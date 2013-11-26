//
//  PAKFoundation.h
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAKProtocols.h"

@interface NSEnumerator (OCPAK) <PAKSeqPacker>
@end

@interface NSArray (OCPAK) <PAKSeqPacker>
@end

@interface NSMutableArray (OCPAK) <PAKSeqUnpacker>
@end

@interface NSOrderedSet (OCPAK) <PAKSeqPacker>
@end

@interface NSMutableOrderedSet (OCPAK) <PAKSeqUnpacker>
@end

@interface NSDictionary (OCPAK) <PAKSeqPacker>
@end

@interface NSValue (OCPAK) <PAKSeqPacker>
@end