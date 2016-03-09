//
//  RestaurantLibrary.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 09/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantLibrary.h"

@interface RestaurantLibrary ()

@property (strong, nonatomic) NSMutableArray <Restaurant*> *storageArray;

@end

@implementation RestaurantLibrary

- (void)addRestaurant:(Restaurant *)restaurant {

    [self.storageArray addObject:restaurant];
}

- (NSArray<Restaurant *> *)allRestaurants {

    return [self.storageArray copy];
}

- (NSMutableArray<Restaurant *> *)storageArray {

    if (!_storageArray) {
        _storageArray = [[NSMutableArray alloc] init];
    }

    return _storageArray;
}
@end
