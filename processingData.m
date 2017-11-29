//
//  processingData.m
//  K2682015
//
//  Created by Alaa on 8/28/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "processingData.h"

@implementation processingData
+(NSArray *)getArrayFromGrade:(int)grade
{
    NSString* kanji;
    switch(grade)
    {
        case 1:
            kanji=Grade1;
            break;
        case 2:
            kanji=Grade2;
            break;
        case 3:
            kanji=Grade3;
            break;
        case 4:
            kanji=Grade4;
            break;
        case 5:
            kanji=Grade5;
            break;
        case 6:
            kanji=Grade6;
            break;
        case 7:
            kanji=Grade7;
            break;
        case 8:
            kanji=Grade8;
            break;
        case 9:
            kanji=Grade9;
            break;
        case 10:
            kanji=Grade10;
            break;
        case 11:
            kanji=Grade11;
            break;
        default:
            break;
    }
    
    NSMutableArray* kanjiArray= [NSMutableArray array];
    [kanji enumerateSubstringsInRange:NSMakeRange(0, [kanji length])
                                       options:(NSStringEnumerationByComposedCharacterSequences)
                                    usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                        [kanjiArray addObject:substring];
                                    }];
    return kanjiArray;
}
@end
