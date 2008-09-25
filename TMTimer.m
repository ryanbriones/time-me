//
//  TMTimer.m
//  Time Me
//
//  Created by Ryan Carmelo Briones on 9/21/08.
//

#import "TMTimer.h"


@implementation TMTimer
- (id) initWithDescription: (NSString *) newDescription {
  [super init];

  timerDescription = newDescription;
  createdAt = [NSCalendarDate calendarDate];
  durationInSeconds = 0;
  stopped = NO;

  return self;
}

@synthesize timerDescription;
@synthesize createdAt;
@synthesize durationInSeconds;
@synthesize stopped;

- (void) start {
}
- (void) stop {
}
- (void) tick {
  if(![self stopped]) {
    durationInSeconds++;
  }
}
- (NSDictionary *) attributesForTimer {
  NSNumber *durationAsObject = [NSNumber numberWithInteger: self.durationInSeconds];
  NSArray *values = [NSArray arrayWithObjects: self.timerDescription, self.createdAt, durationAsObject, nil];
  NSArray *keys = [NSArray arrayWithObjects: @"timerDescription", @"createdAt", @"durationInSeconds", nil];

  return [NSDictionary dictionaryWithObjects: values forKeys: keys];
}

@end
