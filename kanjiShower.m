//
//  kanjiShower.m
//  K2682015
//
//  Created by Alaa on 8/30/15.
//  Copyright (c) 2015 Alaa. All rights reserved.
//

#import "kanjiShower.h"

@interface kanjiShower ()

@end

@implementation kanjiShower

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"KS->%d",self.kanjiID);
    
    
    
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    oneKanjiViewController *startingViewController = [self viewControllerAtIndex:self.kanjiID];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
   // self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    // Do any additional setup after loading the view.
////
self.automaticallyAdjustsScrollViewInsets = false;

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



#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((oneKanjiViewController*) viewController).kanjiID;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((oneKanjiViewController*) viewController).kanjiID;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.currentGradeArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



- (oneKanjiViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.currentGradeArray count] == 0) || (index >= [self.currentGradeArray count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    oneKanjiViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.oneKanji = self.currentGradeArray[index];
    pageContentViewController.kanjiID = index;
    
    return pageContentViewController;
}

@end
