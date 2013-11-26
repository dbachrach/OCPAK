//
//  OCPAK.h
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import "PAKProtocols.h"
#import "PAKPassthroughTuple.h"
#import "PAKFoundation.h"

#define from ,

void unpack(id<PAKSeqUnpacker> unpacker, id<PAKSeqPacker> packer)
{
	[unpacker unpack:[packer pack]];
}


