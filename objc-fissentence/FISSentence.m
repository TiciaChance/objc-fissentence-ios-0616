//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Flatiron School on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"


@interface  FISSentence ()

@property (strong, nonatomic,readwrite) NSString *sentence;

-(void)assembleSentence;

@end

@implementation FISSentence

//PRIVATE methods

-(void)assembleSentence {
    
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
}

-(BOOL) validWord: (NSString *)word {
    
    if(word.length == 0 || [word isEqualToString:@" " ] || [word isEqual:nil]) {
        return 0;
        
    }
    return 1;
}
-(BOOL) validPunctuation: (NSString *) punctuation {
    
    NSString *newPunct = @".?!,;:—";
    if(punctuation == nil || ![newPunct containsString:punctuation]){
        return 0;
    }
    
    return 1;
}
-(BOOL)validIndex:(NSUInteger) index {
    if(index >= self.words.count) {
        return 0;
    }
    return 1;
}


// PUBLIC methods
-(void)addWord:(NSString *) word {
    
    if([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
    
    
    //NSLog(@" this is the string %@, this is the array \n\n\n%@\n\n\n", word, theWordsArray);
    
}
-(void)addWords:(NSArray *) words withPunctuation: (NSString *) punctuation {
    
    //should add the words from this method's array into the property array
    for(NSString *word in words) {
        //should not add empty strings or spaces to self words array
        if([self validWord:word]) {
            [self.words addObject:word];
        }
    }
    
    //should do nothing if the words argu is an empty array
    if([words isEqualToArray:@[]] || words.count == 0) {
        return;
    }
    
    //should do nothing if the punctuation argu is an empty string/nil/non-punct char
    if(![self validPunctuation:punctuation]) {
        return;
    }
    
    // should overwite the punctuations added my assemble sentence
    self.punctuation = punctuation;
    [self assembleSentence];
}


-(void)removeWordAtIndex:(NSUInteger) index{
    //should remove string from words property at the index position specified
    
    if([self validIndex:index]){
        
        [self.words removeObjectAtIndex:index];
    }
    //NSLog(@"\n\n%lu\n\n", index);
    [self assembleSentence];
    
}
-(void)insertWord: (NSString *) word atIndex:(NSUInteger) index {
    if([self validIndex:index] && [self validWord:word]) {
    [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
    
}
-(void)replacePunctuationWithPunctuation: (NSString *) punctuation {
    
    if([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];

}
-(void)replaceWordAtIndex: (NSUInteger) index withWord: (NSString *) word {
    //overwrite string in self.words array at the positon given by the index argu w/ the new word
        if([self validWord:word] && [self validIndex:index]){
            [self.words replaceObjectAtIndex:index withObject:word];
        }
    [self assembleSentence];

}

@end
