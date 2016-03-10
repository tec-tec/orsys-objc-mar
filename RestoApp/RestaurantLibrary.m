//
//  RestaurantLibrary.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 09/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantLibrary.h"
#import "Restaurant.h"

@interface RestaurantLibrary ()

@property (strong, nonatomic) NSMutableArray <Restaurant*> *storageArray;

@end

@implementation RestaurantLibrary

- (instancetype)initWithDefaultData
{
    self = [super init];
    if (self) {
        [self prepareDefaultData];
    }
    return self;
}

- (void)addRestaurant:(Restaurant *)restaurant {

    [self.storageArray addObject:restaurant];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:kNotificationRestaurantAdded object:nil];
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

- (void)prepareDefaultData {

    for (int i = 1; i<=10; i++) {
        Restaurant *resto = [[Restaurant alloc] init];
        resto.name = [NSString stringWithFormat:@"Resto %d", i];
        resto.address = [NSString stringWithFormat:@"%d Rue de Rivoli, Paris", i];
        resto.style = [NSString stringWithFormat:@"Style %d", i];
        resto.visited = NO;
        resto.grade = -1;
        [self.storageArray addObject:resto];

    }

}
@end
