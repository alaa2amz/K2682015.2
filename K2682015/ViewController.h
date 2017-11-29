//
//  ViewController.h
//  K2682015
//
//  Created by Alaa on 8/26/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "KanjiViewController.h"
@interface ViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>
@property NSUInteger gradeIndex;
@property (strong,nonatomic)NSMutableArray *grades;


@end

