//
//  TMTimer.h
//  Time Me
//
//  Created by Ryan Carmelo Briones on 9/21/08.
//

#import <Cocoa/Cocoa.h>


@interface TMTimer : NSObject {
  NSString *timerDescription;
  NSCalendarDate *createdAt;
  NSInteger durationInSeconds;
  BOOL stopped;
}

@property (assign,readwrite) NSString *timerDescription;
@property (assign,readonly) NSCalendarDate *createdAt;
@property (assign,readonly) NSInteger durationInSeconds;
@property (assign,readonly) BOOL stopped;

- (id) initWithDescription: (NSString *) newDescription;
- (void) startTimer;
- (void) restartTimer;
- (void) stopTimer;
- (void) tickTimer;
- (NSDictionary *) attributesForTimer;

@end
