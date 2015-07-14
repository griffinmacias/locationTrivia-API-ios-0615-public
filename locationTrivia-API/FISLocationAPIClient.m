//
//  FISLocationAPIClient.m
//  locationTrivia-API
//
//  Created by Mason Macias on 7/14/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationAPIClient.h"
#import <AFNetworking.h>
#import "FISLocation.h"
@implementation FISLocationAPIClient



+(void)getLocationsFromAPI:(void (^)(NSArray *locations))completionBlock
{
    NSString *locationURL = @"http://locationtrivia.herokuapp.com/locations.json?key=a6ca9bf68b70f2fbdb5427a42bfbfe49fab138c4";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:locationURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //
    }];
}

+(void)addLocationsFromAPI:(FISLocation *)location completionBlock:(void (^)(BOOL success))completionBlock
{
    NSString *locationURL = @"http://locationtrivia.herokuapp.com/locations.json?key=a6ca9bf68b70f2fbdb5427a42bfbfe49fab138c4";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"location[name]":location.name, @"location[latitude]":location.latitude, @"location[longitude]":location.longitude};
    [manager POST:locationURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(YES);
        NSLog(@"TASK %@",task);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.description);
        completionBlock(NO);
    }];
}

+(void)deleteLocationsFromAPI:(FISLocation *)location completionBlock:(void (^)(BOOL success))completionBlock
{
    NSString *locationURL = @"http://locationtrivia.herokuapp.com/locations.json?key=a6ca9bf68b70f2fbdb5427a42bfbfe49fab138c4";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"location[name]":location.name, @"location[latitude]":location.latitude, @"location[longitude]":location.longitude};
    [manager DELETE:locationURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(YES);
        NSLog(@"TASK %@",task);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.description);
        completionBlock(NO);
    }];
}









@end
