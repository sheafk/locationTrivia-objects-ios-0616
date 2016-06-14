//  FISAppDelegate.m

#import "FISAppDelegate.h"


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (NSArray *)allLocationNames {
    
    // NSArray *allLocations = [[NSArray alloc]initWithArray:FISLocation.name];
    
    NSMutableArray *allLocations = [[NSMutableArray alloc]init];
    
    for (FISLocation *object in self.locations) {
        
        [allLocations addObject:[object valueForKey:@"name"]];
        //            NSLog(@"All locations: %@", allLocations);
        //            NSLog(@"Object value for Key: %@", [object valueForKey:@"name"]);
        
    }
    return allLocations;
}

- (FISLocation *)locationNamed: (NSString *)name {
    
    for (FISLocation *object in self.locations) {
        
        if ([name isEqualToString:[object valueForKey:@"name"]]) {
            return object;
        }
    }
    return nil;
}



- (NSArray *)locationsNearLatitude: (CGFloat)latitude
                         longitude: (CGFloat)longitude
                            margin: (CGFloat)margin {
    
    NSMutableArray *locationsInMargin = [NSMutableArray new]; //Look into fabs how to use margins.
    
    for (FISLocation *object in self.locations) {
        
        //        if (((latitude < (object.latitude + margin)) || (latitude > (object.latitude - margin))) && ((longitude < (object.longitude + margin)) || (longitude > (object.longitude - margin)))) {
        //
        
        if (fabs(object.latitude - latitude) <= margin) {
            
            if (fabs(object.longitude - longitude) <= margin) {
                [locationsInMargin addObject:object];
            }
        }
        
    }
    
    return locationsInMargin;
}


@end
