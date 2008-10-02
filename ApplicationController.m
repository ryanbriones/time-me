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
  int row = [myTimers selectedRow];
  if (row == -1) {
    return;
  }

  if ([[timers objectAtIndex: row] stopped]) {
    [timers removeObjectAtIndex: row];
  } else {
    // alert user that they are removing a timer that is not stoppped
  }

  [myTimers reloadData];
}
- (void) toggleTimer: (id) sender {
  int row = [myTimers selectedRow];
  if (row == -1) {
    return;
  }

  if ([[timers objectAtIndex: row] stopped]) {
    [[timers objectAtIndex: row] restartTimer];
    [toggleTimerButton setTitle: @"Stop Timer"];
  } else {
    [[timers objectAtIndex: row] stopTimer];
    [toggleTimerButton setTitle: @"Restart Timer"];
  }
}
- (void) tickAllTimers: (NSTimer *) theTimer {
  for(TMTimer *timer in timers) {
    if(![timer stopped]) {
      [timer tickTimer];
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
- (void) tableViewSelectionDidChange: (NSNotification *) notification {
  int row = [myTimers selectedRow];
  if (row == -1) {
    [toggleTimerButton setTitle: @"Stop Timer"];
    return;
  }

  if ([[timers objectAtIndex: row] stopped]) {
    [toggleTimerButton setTitle: @"Restart Timer"];
  } else {
    [toggleTimerButton setTitle: @"Stop Timer"];
  }
}

@end
