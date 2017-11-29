//
//  AKanjiInfo.m
//  akoc
//
//  Created by Alaa on 12/4/14.
//  Copyright (c) 2014 Alaa. All rights reserved.
//

#import "AKanjiInfo.h"
#import "FMDatabase.h"

@implementation AKanjiInfo

-(NSString *)getMeaning:(NSString *)kanji{
   NSString *path = [[NSBundle mainBundle] pathForResource:@"kanjidicUtf8" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
   //NSLog(@"--%@",content);

    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:[NSString stringWithFormat:@"^(.*?%@.*?)$",kanji] options:NSRegularExpressionAnchorsMatchLines error:&error];
    //NSLog(@"----%@",content);
    //
   // NSRange hk= NSMakeRange(0, [content length]);
   // NSTextCheckingResult *match = [regex firstMatchInString:alaa options:0 range:hk];
    
    
    NSTextCheckingResult *match = [regex firstMatchInString:content options:0 range:NSMakeRange(0, [content length])];
    //
    __block   NSString  *joinedComponents= [[NSString alloc] init];
     __block NSMutableArray *meanings =[[NSMutableArray alloc] init];
  __block NSString *found;
    
    //NSTextCheckingResult *match;
    if (match) {
        NSRange range = [match rangeAtIndex:1];
        NSString *matchString = [content substringWithRange:range];
     //   NSLog(@"---+---%@__------++++", matchString);
    
    
    
    
    NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"[{]([^}]*)[}]" options:0 error:&error];
    [regex2 enumerateMatchesInString:matchString options:0 range:NSMakeRange(0, [matchString length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        NSRange range = [result rangeAtIndex:1];
         found = [matchString substringWithRange:range];
      // NSLog(@"%@---", found);
        [meanings addObject:found];
       // NSLog(@"%@--m-", meanings);

      joinedComponents = [meanings componentsJoinedByString:@" , "];
      
    }];

    }
    NSMutableString *val = [joinedComponents mutableCopy];
    return val;
    



}





-(NSString *)getReadings:(NSString *)kanji{
    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:fileName];
    [database open];
   
    FMResultSet *results2 = [database executeQuery:[NSString stringWithFormat:@"select * from jouyou_kanji where col_3='%@'",kanji]];
   // NSLog(@"User: %@ - rr",results2);

    __block NSString *col_2;
    __block NSString *col_3;
    while([results2 next]) {
        col_2 = [results2 stringForColumn:@"col_2"];
        col_3  = [results2 stringForColumn:@"col_3"];
      //  NSLog(@"User: %@ - %@",col_2, col_3);
        //_labeltest.stringValue=[NSString stringWithFormat:@"%@-%@", col_2,col_3];;
    }
    //NSLog(@"User: %@ - %@---test1---",col_2, col_3);
    
   
    
    
    
    
    
    
    FMResultSet *results3 = [database executeQuery:[NSString stringWithFormat:@"select * from jouyou_kanji_reading where col_2='%@'",col_2]];
    
    __block NSString *col_3k;
    __block NSString *col_4k;
    __block NSString *col_5k;
    NSMutableString *buffer=[[NSMutableString alloc] init];
   // [buffer appendString:@"Reading"];
   // [buffer appendString:@" \t\t"];
   // [buffer appendString:@"Type"];
    //[buffer appendString:@"\t"];
    //[buffer appendString:@"Examples"];
    //[buffer appendString:@"\n"];

    
    while([results3 next]) {
        col_3k = [results3 stringForColumn:@"col_3"];
        col_4k = [results3 stringForColumn:@"col_4"];
        col_5k = [results3 stringForColumn:@"col_5"];
        [buffer appendString:col_3k];
        [buffer appendString:@" \t"];
        [buffer appendString:([col_5k isEqual:@"1"])?@"on":@"kun"];
        [buffer appendString:@"\n"];
        [buffer appendString:col_4k];
        [buffer appendString:@"\n"];
        [buffer appendString:@"\n"];

        //NSLog(@"User: %@ - %@ - %@",col_3k, col_4k,col_5k);
        //_labeltest.stringValue=[NSString stringWithFormat:@"%@-%@", col_2,col_3];;
    }

    [database close];
    
    
    
    
    
    
   // NSArray *R=[[NSArray alloc] init];
    return buffer;
}


@end
