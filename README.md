Write Objective C _like a boss_.<br/>
You can get the idea in [this post](http://mneorr.com/adding-some-ruby-sugar-to-objectivec/).

<br/>
[![Build Status](https://travis-ci.org/mneorr/ObjectiveSugar.png?branch=master)](https://travis-ci.org/mneorr/ObjectiveSugar)
## Installation

__Cocoapods__: `pod 'ObjectiveSugar'`<br>
__Manual__: Copy the __Classes__ folder in your project<br>

`#import <ObjectiveSugar/ObjectiveSugar.h>`


#### NSNumber additions

``` objc
[@3 times:^{
  NSLog(@"Hello!");
}];
// Hello!
// Hello!
// Hello!

[@3 timesWithIndex:^(NSUInteger index) {
  NSLog(@"Another version with number: %d", index);
}];
// Another version with number: 0
// Another version with number: 1
// Another version with number: 2


[@1 upto:4 do:^(NSInteger numbah) {
  NSLog(@"Current number.. %d", numbah);
}];
// Current number.. 1
// Current number.. 2
// Current number.. 3
// Current number.. 4

[@7 downto:4 do:^(NSInteger numbah) {
  NSLog(@"Current number.. %d", numbah);
}];
// Current number.. 7
// Current number.. 6
// Current number.. 5
// Current number.. 4

NSDate *newYearsDay = [NSDate newYearsDate]; // let's pretend it's a new year
NSDate *firstOfDecember = [@(31).days since:newYearsDay];
// 2012-12-01 00:00:00 +0000

NSDate *future = @(24).days.fromNow;
// 2012-12-25 20:49:05 +0000

NSDate *past = @(1).month.ago;
// 2012-11-01 20:50:28 +00:00

NSDate *christmas = [@(7).days until:newYearsDay];
// 2012-12-25 00:00:00 +0000

```

#### NSArray / NSSet additions

``` objc
// All of these methods return a modified copy of the array.
// They're not modifying the source array.

NSArray *cars = @[@"Testarossa", @"F50", @"F458 Italia"]; // or NSSet

[cars each:^(id object) {
    NSLog(@"Car: %@", object);
}];
// Car: Testarossa
// Car: F50
// Car: F458 Italia

[cars eachWithIndex:^(id object, NSUInteger index) {
    NSLog(@"Car: %@ index: %i", object, index);
}];
// Car: Testarossa index: 0
// Car: F50 index: 1
// Car: F458 Italia index: 2

cars.first;
// Testarossa
cars.last
// 458 Italia
cars.sample
// 458 Italia
cars.sample
// F50

[cars map:^id(id car){
    return @([[car substringToIndex:1] isEqualToString:@"F"]);
}];
// NO, YES, YES

NSArray *mixedData = @[ @1, @"Objective Sugar!", @"Github", @4, @"5"];

[mixedData select:^BOOL(id object) {
  return ([object class] == [NSString class]);
}];
// Objective Sugar, Github, 5

[mixedData reject:^BOOL(id object) {
  return ([object class] == [NSString class]);
}];
// 1, 4

NSArray *numbers = @[ @5, @2, @7, @1 ];
[numbers sort];
// 1, 2, 5, 7
```

#### NSArray only

``` objc

NSArray *numbers = @[@1, @2, @3, @4, @5, @6];

// index from 2 to 4
numbers[@"2..4"];
// [@3, @4, @5]

// index from 2 to 4 (excluded)
numbers[@"2...4"];
// [@3, @4]

// With NSRange location: 2, length: 4
numbers[@"2,4"];
// [@3, @4, @5, @6]

NSValue *range = [NSValue valueWithRange:NSMakeRange(2, 4)];
numbers[range];
// [@3, @4, @5, @6]

NSArray *fruits = @[ @"banana", @"mango", @"apple", @"pear" ];

NSLog(@"Is apple a fruit? %@", [fruits includes:@"apple"] ? @"Yes" : @"No"];
// Is apple a fruit? Yes

[fruits take:3];
// banana, mango, apple

[someFruits takeWhile:^BOOL(id fruit) {
  return ![fruit isEqualToString:@"apple"];
}];
// banana, mango

NSArray *nestedArray = @[ @[ @1, @2, @3 ], @[ @4, @5, @6, @[ @7, @8 ] ], @9, @10 ];
[nestedArray flatten];
// 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

NSArray *abc = @[ @"a", @"b", @"c" ];
[abc join];
// abc

[abc join:@"-"];
// a-b-c

NSArray *obverseArray = @[@1, @2, @3, @4, @5];
[obverseArray reverse];
// [@5, @4, @3, @2, @1]

NSArray *mixedData = @[ @1, @"Objective Sugar!", @"Github", @4, @"5"];

[mixedData detect:^BOOL(id object) {
  return ([object class] == [NSString class]);
}];
// Objective Sugar



// TODO: Make a better / simpler example of this
NSArray *landlockedCountries = @[ @"Bolivia", @"Paraguay", @"Austria", @"Switzerland", @"Hungary" ];
NSArray *europeanCountries = @[ @"France", @"Germany", @"Austria", @"Spain", @"Hungary", @"Poland", @"Switzerland" ];


[landlockedCountries intersectionWithArray:europeanCountries];
// landlockedEuropeanCountries = Austria, Switzerland, Hungary

[landlockedCountries unionWithArray:europeanCountries];
// landlockedOrEuropean = Bolivia, Paraguay, Austria, Switzerland, Hungary, France, Germany, Spain, Poland

[landlockedCountries relativeComplement:europeanCountries];
// nonEuropeanLandlockedCountries = Bolivia, Paraguay

[europeanCountries relativeComplement:landlockedCountries];
// notLandlockedEuropeanCountries = France, Germany, Spain, Poland

[landlockedCountries symmetricDifference:europeanCountries];
// uniqueCountries = Bolivia, Paraguay, France, Germany, Spain, Poland
```

#### NSMutableArray additions

``` objc
NSMutableArray *people = @[ @"Alice", @"Benjamin", @"Christopher" ];

[people push:@"Daniel"]; // Alice, Benjamin, Christopher, Daniel

[people pop]; // Daniel
// people = Alice, Benjamin, Christopher

[people pop:2]; // Benjamin, Christopher
// people = Alice

[people concat:@[ @"Evan", @"Frank", @"Gavin" ]];
// people = Alice, Evan, Frank, Gavin

```

#### NSDictionary additions

``` objc
NSDictionary *dict = @{ @"one" : @1, @"two" : @2, @"three" : @3 };

[dict each:^(id key, id value){
    NSLog(@"Key: %@, Value: %@", key, value);
}];
// Key: one, Value: 1
// Key: two, Value: 2
// Key: three, Value: 3

[dict eachKey:^(id key) {
    NSLog(@"Key: %@", key);
}];
// Key: one
// Key: two
// Key: three

[dict eachValue:^(id value) {
    NSLog(@"Value: %@", value);
}];
// Value: 1
// Value: 2
// Value: 3

NSDictionary *errors = @{
    @"username" : @[ @"already taken" ],
    @"password" : @[ @"is too short (minimum is 8 characters)", @"not complex enough" ],
    @"email" : @[ @"can't be blank" ];
};

[errors map:^(id attribute, id reasons) {
    return NSStringWithFormat(@"%@ %@", attribute, [reasons join:@", "]);
}];
// username already taken
// password is too short (minimum is 8 characters), not complex enough
// email can't be blank

[errors hasKey:@"email"]
// true
[errors hasKey:@"Alcatraz"]
// false
```

#### NSString additions

``` objc
NSString *sentence = NSStringWithFormat(@"This is a text-with-argument %@", @1234);
// This is a text-with-argument 1234

[sentence split];
// array = this, is, a, text-with-argument, 1234

[sentence split:@"-"]
// array = this is a text, with, argument 1234

[sentence containsString:@"this is a"];
// YES
```

#### C additions

``` objc
unless(_messages) {
    // The body is only executed if the condition is false
    _messages = [self initializeMessages];
}

int iterations = 10;
until(iterations == 0) {
    // The body is executed until the condition is false
    // 10 9 8 7 6 5 4 3 2 1
    printf("%d ", iterations);
    iterations--;
}
printf("\n");

iterations = 10;
do {
    // The body is executed at least once until the condition is false
    // Will print: Executed!
    printf("Executed!\n");
} until(true);
```

#### Contributing

ObjectiveSugar is tested with [Kiwi](https://github.com/allending/Kiwi), and tests are located in SampleProject.<br/>
If you plan on contributing to the project, please:

  * Write tests
  * Write documentation

<br/>

#### Team

- Marin Usalj [@mneorr](https://github.com/mneorr)
- Neil Cowburn [@neilco](https://github.com/neilco)

