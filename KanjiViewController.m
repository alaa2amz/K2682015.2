//
//  KanjiViewController.m
//  K2682015
//
//  Created by Alaa on 8/28/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "KanjiViewController.h"
#import "kanjiShower.h"
@interface KanjiViewController ()

@end

@implementation KanjiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentGradeArray=[[NSArray alloc] init];
    self.currentGradeArray=[processingData getArrayFromGrade:self.gradeIndex+1];
    
    
    
    self.gradeName= [NSString stringWithFormat:@"%@ %lu",@"Grade",(unsigned long)self.gradeIndex+1];
    self.navigationItem.title = self.gradeName;
    
    
    // NSLog(@"KVC->%ld",self.gradeIndex);

    // Do any additional setup after loading the view.
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




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.currentGradeArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *kanjiLabel = (UILabel *)[cell viewWithTag:100];
    kanjiLabel.text = [self.currentGradeArray objectAtIndex:indexPath.item];
    
    return cell;
}

static NSInteger selectedKanjiID;

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedKanjiID=indexPath.item;
    //NSLog(@"%@",[self.currentGradeArray objectAtIndex:indexPath.item]);
    [self performSegueWithIdentifier:@"toKanjiShower" sender:nil];
    NSLog(@"skid->%ld",(long)selectedKanjiID);
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toKanjiShower"]) {
        kanjiShower *KS =  segue.destinationViewController;
        KS.currentKanji=[self.currentGradeArray objectAtIndex:selectedKanjiID];
        KS.kanjiID=selectedKanjiID;
        KS.currentGradeArray=self.currentGradeArray;
        //oneKanjiViewController *OKVC= segue.destinationViewController;
        //OKVC.kanjiID=selectedKanjiID;
    }
}



@end
