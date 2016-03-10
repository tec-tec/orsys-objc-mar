//
//  RestaurantTableViewController.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 10/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantTableViewController.h"
#import "RestaurantLibrary.h"

@interface RestaurantTableViewController ()

@property (strong, nonatomic) RestaurantLibrary *library;

@end

@implementation RestaurantTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (RestaurantLibrary *)library {

    if (!_library) {
        _library = [[RestaurantLibrary alloc] init];
    }

    return _library;
}

@end
