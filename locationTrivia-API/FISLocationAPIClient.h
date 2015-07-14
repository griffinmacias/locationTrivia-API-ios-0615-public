//
//  FISLocationAPIClient.h
//  locationTrivia-API
//
//  Created by Mason Macias on 7/14/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLocation.h"
@interface FISLocationAPIClient : NSObject

+(void)getLocationsFromAPI:(void (^)(NSArray *locations))completionBlock;
+(void)addLocationsFromAPI:(FISLocation *)location completionBlock:(void (^)(BOOL success))completionBlock;
@end
