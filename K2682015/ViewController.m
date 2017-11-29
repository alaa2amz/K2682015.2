//
//  ViewController.m
//  K2682015
//
//  Created by Alaa on 8/26/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.grades=[[NSMutableArray alloc]init];
    for (int i=1; i<12; i++) {
        [self.grades addObject:[NSNumber numberWithInt:i]];
        
    }
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.grades count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"kanji";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
   NSString *joinString= [NSString stringWithFormat:@"%@ %@",@"Grade",[[self.grades objectAtIndex:indexPath.row] stringValue]];
    cell.textLabel.text =joinString ;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    self.gradeIndex=indexPath.row;
[self performSegueWithIdentifier:@"toKanji" sender:NULL];
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toKanji"]) {
        KanjiViewController *KVC =  segue.destinationViewController;
        KVC.gradeIndex=self.gradeIndex;
         }
}


@end
