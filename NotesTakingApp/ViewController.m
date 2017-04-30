//
//  ViewController.m
//  NotesTakingApp
//
//  Created by Kemuel Clyde Belderol on 22/03/2017.
//  Copyright © 2017 Burst. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
#import "DetailsTableViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *notes;
@property (strong, nonatomic) NSMutableArray *images;



@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [super viewDidLoad];
    self.images = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"Mewtwo"], [UIImage imageNamed:@"Mew"], [UIImage imageNamed:@"Rayquaza"], nil];
    
  
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self =[super initWithCoder:aDecoder];
    if(self) {
        _notes = [NSMutableArray array];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell" forIndexPath:indexPath];
    [cell.textLabel setText:[self.notes[indexPath.row] title]];
    [cell.imageView setImage:[self.images objectAtIndex:indexPath.row]];
    return cell;
}



-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return  YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return  YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
             AudioServicesPlaySystemSound(0x450);
    if(editingStyle == UITableViewCellEditingStyleDelete) {

        [self.notes removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}




- (IBAction)addNote:(id)sender {
     AudioServicesPlaySystemSound(0x450);
    
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showNote"]){
        AudioServicesPlaySystemSound(0x450);
        DetailsTableViewController *destinationViewController = [segue destinationViewController];
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        destinationViewController.note = self.notes[selectedIndexPath.row];
        
    } else if([segue.identifier isEqualToString:@"addNote"]) {
        AudioServicesPlaySystemSound(0X450);
        Note *newNote = [Note new];
        [self.notes addObject:newNote];
        DetailsTableViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.note = newNote;
    }
}









@end
