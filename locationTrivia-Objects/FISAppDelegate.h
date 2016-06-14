//  FISAppDelegate.h

#import <UIKit/UIKit.h>
#import "FISLocation.h"


@class FISLocation;
@class FISTrivium; //Added this hoping that it would make the object appear in FISTrivium...

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *locations;

- (NSArray *)allLocationNames;

- (FISLocation *)locationNamed: (NSString *)name;

- (NSArray *)locationsNearLatitude: (CGFloat)latitude
                         longitude: (CGFloat)longitude
                            margin: (CGFloat)margin;


@end
