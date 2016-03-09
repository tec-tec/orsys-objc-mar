//
//  RestaurantLibrary.h
//  RestoApp
//
//  Created by Ludovic Ollagnier on 09/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Restaurant;

@interface RestaurantLibrary : NSObject

- (void)addRestaurant:(Restaurant *)restaurant;
- (NSArray <Restaurant *> *)allRestaurants;

@end
