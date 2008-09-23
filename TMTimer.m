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

  description = newDescription;
  createdAt = [NSCalendarDate calendarDate];
  lastStartedAt = [createdAt copy];
  durationInSeconds = 0;

  return self;
}

@synthesize description;
@synthesize createdAt;
@synthesize lastStartedAt;
@synthesize durationInSeconds;

- (void) start {
}
- (void) stop {
}
- (NSDictionary *) attributesForTimer {
  NSNumber *durationAsObject = [NSNumber numberWithInteger: self.durationInSeconds];
  NSArray *values = [NSArray arrayWithObjects: self.description, self.createdAt, self.lastStartedAt, durationAsObject, nil];
  NSArray *keys = [NSArray arrayWithObjects: @"description", @"createdAt", @"lastStartedAt", @"durationInSeconds", nil];

  return [NSDictionary dictionaryWithObjects: values forKeys: keys];
}

@end
