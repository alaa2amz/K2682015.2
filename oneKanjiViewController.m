//
//  oneKanjiViewController.m
//  K2682015
//
//  Created by Alaa on 8/30/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "oneKanjiViewController.h"

@interface oneKanjiViewController ()

@end

@implementation oneKanjiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    
    
    self.oneKanjiLabel.text=self.oneKanji;
    
    
     self.minchoLabel.text=self.oneKanji;
    self.strokeOrderLabel.text=self.oneKanji;
    AKanjiInfo *myKanjiInfo=[[AKanjiInfo alloc] init];
    self.meaningTextBox.text=[myKanjiInfo getMeaning:self.oneKanji];
    self.readingTextBox.text=[myKanjiInfo getReadings:self.oneKanji];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
