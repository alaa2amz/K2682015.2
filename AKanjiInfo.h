//
//  AKanjiInfo.h
//  akoc
//
//  Created by Alaa on 12/4/14.
//  Copyright (c) 2014 Alaa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKanjiInfo : NSObject
-(NSString *)getMeaning:(NSString *)kanji;
-(NSString *)getReadings:(NSString *)kanji;


@end
