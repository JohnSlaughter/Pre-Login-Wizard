//
//  AppDelegate.h
//  Pre-Login Wizard
//
//  Copyright 2013 John W. Slaughter, Jr.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.


#import <Cocoa/Cocoa.h>
#import <QuartzCore/CoreAnimation.h>


@interface AppDelegate : NSObject <NSApplicationDelegate> {
    CATransition    *transition;
    NSView          *contentView;
    NSDictionary    *animation;
}

#pragma mark - Application Properties
@property (assign) IBOutlet NSWindow *window;

#pragma mark - Properties to access the views
@property (assign) IBOutlet NSView   *raceTrack;
@property (assign) IBOutlet NSView   *view0;
@property (assign) IBOutlet NSView   *view1;
@property (assign) IBOutlet NSView   *view2;
@property (assign) IBOutlet NSView   *view3;

#pragma mark - Methods to handle view changes
- (IBAction)zeroToOne:  (id)sender;
- (IBAction)oneToTwo:   (id)sender;
- (IBAction)twoToThree: (id)sender;
- (IBAction)twoToOne:   (id)sender;
@end
