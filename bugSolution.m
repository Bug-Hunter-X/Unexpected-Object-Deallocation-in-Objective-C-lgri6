To fix this, we must ensure that 'MyObject' is properly retained.  If using manual reference counting (MRC), we would use `retain` when creating the object and `release` when finished.  If using Automatic Reference Counting (ARC), we simply need to make sure the object's reference count remains valid within the lifecycle where the object is needed. The solution usually involves creating a strong property to hold the object or assigning it to an instance variable. 

Here's an example of a solution using ARC:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) MyObject *myObject;
@end

@implementation MyClass
- (void)someMethod {
    self.myObject = [[MyObject alloc] init];
    // ... use myObject ...
}
@end
```

By making `myObject` a strong property, ARC ensures the object's lifetime is tied to the lifetime of `MyClass`, preventing premature deallocation.