### Installation

__Cocoapods__: `pod 'ObjectiveSugar'` <br/>
__Manual__: Copy the __src__ folder in your project<br/>

`#import "ObjectiveSugar.h"`


#### NSNumber additions

``` objc
[@3 times:^{
  NSLog(@"Hello!");
}];
// Hello!
// Hello!
// Hello!

[@3 timesWithIndex:^(int index) {
  NSLog(@"Another version with number: %d", index);
}];
// Another version with number: 0
// Another version with number: 1
// Another version with number: 2


[@1 upto:4 do:^(int numbah) {
  NSLog(@"Current number.. %d", numbah);        
}];
// Current number.. 1
// Current number.. 2
// Current number.. 3
// Current number.. 4

[@7 downto:4 do:^(int numbah) {
  NSLog(@"Current number.. %d", numbah);        
}];
// Current number.. 7
// Current number.. 6
// Current number.. 5
// Current number.. 4
```

#### NSArray / NSSet additions

``` objc
NSArray *cars = [@"Testarossa", @"F50", @"F458 Italia"]; 
// or NSSet *cars = [NSSet setWithObjects:@"Testarossa", @"F50", @"F458 Italia", nil];

[cars each:^(id object) {
    NSLog(@"Car: %@", object); 
}];
// Car: Testarossa
// Car: F50
// Car: F458 Italia

[cars eachWithIndex:^(id object, int index) {    
    NSLog(@"Car: %@ index: %i", object, index); 
}];
// Car: Testarossa index: 0
// Car: F50 index: 1
// Car: F458 Italia index: 2

id object = cars.first; // Testarossa
id object = cars.last;  // 458 Italia
```

#### NSArray only
``` objc
NSArray *fruits = @[ @"banana", @"mango", @"apple", @"pear" ];

NSLog(@"Is apple a fruit? %@", [fruits includes:@"apple"] ? @"Yes" : @"No"];
// Is apple a fruit? Yes

[fruits take:3]; 
// banana, mango, apple

[someFruits takeWhile:^BOOL(id fruit) {
	return ![fruit isEqualToString:@"apple"];
}];
// banana, mango


NSArray *landLockedCountries = @[ @"Bolivia", @"Paraguay", @"Austria", @"Switzerland", @"Hungary" ];
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
// uniqueCountries = Bolivia, Paraguay, Austria, Switzerland, Hungary, France, Germany, Spain, Poland

```

#### NSMutableArray additions

``` objc
NSMutableArray *people = @[ @"Alice", @"Benjamin", @"Christopher" ];

[people push:@"Daniel"]; // Alice, Benjamin, Christopher, Daniel

[people pop]; // Daniel
// people = Alice, Benjamin, Christopher

[people pop:2]; // Benjamin, Christopher
// people = Alice

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
```
