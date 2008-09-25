//
//  ApplicationController.h
//  Time Me
//
//  Created by Ryan Carmelo Briones on 9/20/08.
//

#import <Cocoa/Cocoa.h>


@interface ApplicationController : NSObject {
  NSMutableArray *timers;
  NSInteger *rowsVisible;
  NSTimer *periodicTimer;
  
  IBOutlet NSTextField *newTimerDescription;
  IBOutlet NSButton *addTimerButton;
  IBOutlet NSButton *deleteTimerButton;
  IBOutlet NSButton *stopTimerButton;
  IBOutlet NSTableView *myTimers;
}
- (IBAction) addTimer: (id) sender;
- (IBAction) deleteTimer: (id) sender;
- (void) tickAllTimers: (NSTimer *) theTimer;
@end
