//
//  RestaurantLibrary.m
//  RestoApp
//
//  Created by Ludovic Ollagnier on 09/03/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

#import "RestaurantLibrary.h"
#import "Restaurant.h"
@import CloudKit;

@interface RestaurantLibrary ()

@property (strong, nonatomic) NSMutableArray <Restaurant*> *storageArray;
@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *privateDatabase;

@end

@implementation RestaurantLibrary

- (instancetype)initWithDefaultData
{
    self = [super init];
    if (self) {
//        [self prepareDefaultData];
    }
    return self;
}

- (void)addRestaurant:(Restaurant *)restaurant {

    [self.storageArray addObject:restaurant];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:kNotificationRestaurantAdded object:nil];

    [self.privateDatabase saveRecord:[self cloudRecordFromRestaurant:restaurant] completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {

        if (!error) {
            //Everything was OK
        } else {
            //Error, we need to handle it
        }
    }];
}

- (NSArray<Restaurant *> *)allRestaurants {

    return [self.storageArray copy];
}

- (NSMutableArray<Restaurant *> *)storageArray {

    if (!_storageArray) {
        _storageArray = [[NSMutableArray alloc] init];

        CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Restaurant" predicate:[NSPredicate predicateWithValue:YES]];
        [self.privateDatabase performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {

            if (!error) {
                for (CKRecord *r in results) {
                    [_storageArray addObject:[self restaurantFromCloudRecord:r]];
                }
                NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                [center postNotificationName:kNotificationRestaurantAdded object:nil];
            }
        }];
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

- (CKRecord *)cloudRecordFromRestaurant:(Restaurant *)restaurant {

    CKRecord *record = [[CKRecord alloc] initWithRecordType:@"Restaurant"];
    record[@"name"] = restaurant.name;
    record[@"address"] = restaurant.address;
    record[@"style"] = restaurant.style;
    record[@"visited"] = @(restaurant.visited);
    record[@"grade"] = @(restaurant.grade);

    return record;
}

- (Restaurant *)restaurantFromCloudRecord:(CKRecord *)record {

    Restaurant *restaurant = [[Restaurant alloc] init];
    restaurant.name = record[@"name"];
    restaurant.address = record[@"address"];
    restaurant.style = record[@"style"];
    restaurant.visited = [record[@"visited"] boolValue];
    restaurant.grade = [record[@"grade"] floatValue];

    return restaurant;
}

- (CKContainer *)container {

    if (!_container) {
        _container = [CKContainer defaultContainer];
    }

    return  _container;
}

- (CKDatabase *)privateDatabase {

    if (!_privateDatabase) {
        _privateDatabase = [self.container privateCloudDatabase];
    }

    return _privateDatabase;
}
@end
