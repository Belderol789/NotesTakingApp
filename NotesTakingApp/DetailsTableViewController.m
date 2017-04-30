//
//  DetailsTableViewController.m
//  NotesTakingApp
//
//  Created by Kemuel Clyde Belderol on 22/03/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "Note.h"

@interface DetailsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.textField.text = self.note.title;
    self.textView.text = self.note.content;
    
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.note.title = self.textField.text;
    self.note.content = self.textView.text;
}

- (IBAction)saveNote:(id)sender {
    
    
    
    self.note.title = self.textField.text;
    self.note.content = self.textView.text;

    
    
}

@end
