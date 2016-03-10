//
//  RestaurantDetailsViewController.h
//  RestoApp
//
//  Created by Ludovic Ollagnier on 10/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface RestaurantDetailsViewController : UIViewController

@property (strong, nonatomic) Restaurant *restaurantToShow;

@end
