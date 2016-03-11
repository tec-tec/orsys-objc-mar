//
//  RestaurantDetailsViewController.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 10/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "Restaurant.h"

@interface RestaurantDetailsViewController ()

@end

@implementation RestaurantDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = self.restaurantToShow.name;

    UIButton *b= [UIButton buttonWithType:UIButtonTypeInfoDark];
    b.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:b];

    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:b attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];

    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:b attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

    [self.view addConstraints:@[c1,c2]];
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
