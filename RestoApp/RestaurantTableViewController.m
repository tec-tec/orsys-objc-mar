//
//  RestaurantTableViewController.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 10/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantTableViewController.h"
#import "RestaurantLibrary.h"
#import "Restaurant.h"
#import "RestaurantDetailsViewController.h"

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.library allRestaurants] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestoCell" forIndexPath:indexPath];
    
    Restaurant *currentResto = [[self.library allRestaurants] objectAtIndex:indexPath.row];
    cell.textLabel.text = currentResto.name;
    cell.detailTextLabel.text = currentResto.style;

    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if ([segue.identifier isEqualToString:@"showDetails"]) {

        RestaurantDetailsViewController *d = segue.destinationViewController;

        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];

        Restaurant *r = [[self.library allRestaurants]objectAtIndex:ip.row];
        d.restaurantToShow = r;

    }
}


- (RestaurantLibrary *)library {

    if (!_library) {
        _library = [[RestaurantLibrary alloc] initWithDefaultData];
    }

    return _library;
}

@end
