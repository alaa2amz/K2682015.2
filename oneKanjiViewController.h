//
//  oneKanjiViewController.h
//  K2682015
//
//  Created by Alaa on 8/30/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKanjiInfo.h"
@interface oneKanjiViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *oneKanjiLabel;
@property NSInteger kanjiID;
@property NSString* oneKanji;
@property (weak, nonatomic) IBOutlet UITextView *meaningTextBox;
@property (weak, nonatomic) IBOutlet UITextView *readingTextBox;
@property (weak, nonatomic) IBOutlet UILabel *strokeOrderLabel;
@property (weak, nonatomic) IBOutlet UILabel *minchoLabel;

@end
