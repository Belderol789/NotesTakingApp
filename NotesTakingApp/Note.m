//
//  Note.m
//  NotesTakingApp
//
//  Created by Kemuel Clyde Belderol on 22/03/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)init {
    self = [super self];
    if(self) {
        self.title = @"";
        self.content = @"";
        self.image = [UIImage imageNamed:@""];
    }
    return self;
    
    
}

@end
