//
//  kanjiShower.h
//  K2682015
//
//  Created by Alaa on 8/30/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oneKanjiViewController.h"
@interface kanjiShower : UIViewController <UIPageViewControllerDataSource>
@property (strong,nonatomic)NSString* currentKanji;
@property (nonatomic)NSInteger kanjiID;
@property (strong,nonatomic)NSArray* currentGradeArray;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@end
