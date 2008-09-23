//
//  TMTimer.h
//  Time Me
//
//  Created by Ryan Carmelo Briones on 9/21/08.
//

#import <Cocoa/Cocoa.h>


@interface TMTimer : NSObject {
  NSString *description;
  NSCalendarDate *createdAt;
  NSCalendarDate *lastStartedAt;
  NSInteger durationInSeconds;
}

@property (assign,readwrite) NSString *description;
@property (assign,readonly) NSCalendarDate *createdAt;
@property (assign,readonly) NSCalendarDate *lastStartedAt;
@property (assign,readonly) NSInteger durationInSeconds;

- (id) initWithDescription: (NSString *) newDescription;
- (void) start;
- (void) stop;
- (NSDictionary *) attributesForTimer;

@end
