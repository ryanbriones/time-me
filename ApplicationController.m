//
//  ApplicationController.m
//  Time Me
//
//  Created by Ryan Carmelo Briones on 9/20/08.
//

#import "ApplicationController.h"
#import "TMTimer.h"


@implementation ApplicationController
- (id) init {
  [super init];
  
  timers = [[NSMutableArray alloc] init];
  periodicTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(tickAllTimers:) userInfo: nil repeats: YES];
  
  return self;
}

- (void) addTimer: (id) sender {
  NSString *timer_desc = [newTimerDescription stringValue];
  if([timer_desc isEqualToString:@""]) {
    return;
  }
  
  TMTimer *newTimer = [[TMTimer alloc] initWithDescription: timer_desc];
  [timers addObject: newTimer];
  [myTimers reloadData];

  [newTimerDescription setStringValue: @""];
}
- (void) deleteTimer: (id) sender {
}
- (void) tickAllTimers: (NSTimer *) theTimer {
  for(TMTimer *timer in timers) {
    if(![timer stopped]) {
      [timer tick];
    }
  }

  [myTimers reloadData];
}

// newTimerDescription delegate methods
- (BOOL) control: (NSControl *) aControl textView: (NSTextView *) aTextField doCommandBySelector: (SEL) aCommand {
  
  if (aCommand == @selector(insertNewline:)) {
    NSLog(@"ApplicationController: Intercepting 'insertNewline:'");
    
    [self addTimer: aTextField];
    return YES;
  } else {
    return NO;
  }
}

// myTimers delegate methods
- (int) numberOfRowsInTableView: (NSTableView *) tableView {
  return [timers count];
}
- (id) tableView: (NSTableView *) tv objectValueForTableColumn: (NSTableColumn *) tableColumn row: (int) row {
  TMTimer *t = [timers objectAtIndex: row];
  NSDictionary *timerAttributes = [t attributesForTimer];
  
  NSString *key = [tableColumn identifier];
  return [timerAttributes objectForKey: key];
}

@end
