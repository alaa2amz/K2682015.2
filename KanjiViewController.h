//
//  KanjiViewController.h
//  K2682015
//
//  Created by Alaa on 8/28/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "ViewController.h"
#include "processingData.h"
@interface KanjiViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property NSUInteger gradeIndex;
@property NSArray * currentGradeArray;
@property NSString * gradeName;
@end
