+++
Categories = ["Programming"]
Tags = ["Design Patterns", "Cheat Sheet"]
date = "2014-06-02T00:17:00-08:00"
title = "Design Patterns Cheat Sheet"
disqusIdentifier = "266 http://www.richardsumilang.com/blog/?p=266"
aliases = ["/blog/2014/06/02/design-patterns-cheat-sheet"]

+++

Here's a quick cheat sheet for lots of design patterns. The examples in this
post are linked to Java examples however they are not limited to a single
language implementation. Special thanks to Derek Banas.

<!--more-->

- **[Observer Design Pattern:][1]** Contains an object usually referred to as
the `subject` that maintains a a list of dependent classes called `observers`.
The `subject` object notifies all `observers` automatically of any state changes
by calling their methods.
- **[Factory Design Pattern:][2]** Creates objects that share the same super
class type. Usually has a method named like `makeTypeOfSuperClass` which accepts
an argument to tell it what to do.
- **[Abstract Factory Design Pattern:][3]** Groups together individual
factories. The objects that the these factories return share a common API.
- **[Singleton Design Pattern:][4]** Used to eliminate the option of instantiating
more than one object. Contains a static variable that holds the first instance
of the object created. This object is always is returned. Typically returned by
using a `getInstance` method. The constructor is set as a private function to
prevent users instantiating it.
- **[Builder Design Pattern:][5]** Builder objects contain methods that tell a
factory how to build/configure an object.
- **[Prototype Design Pattern:][6]** Creates new objects by copying other
objects. Nice to use a clone factory that accepts an object to clone.
- **[Decorator Design Pattern:][7]** Adds functionality by using many simple
classes.
- **[Command Design Pattern:][8]** Allows you to set aside a list of commands
for later use. Each command is typically it's own command object that implements
the same command interface.
- **[Adapter Design Pattern:][9]** Allows 2 incompatible objects that share a
similar purpose to work transparently by abstraction.
- **[Facade Design Pattern:][10]** Decouples or separates the client from all of
the sub components. Main purpose is to simplify interfaces so you don't have to
worry about what's going on under the hood. Similar to a `Service Design
Pattern` except a Service typically communicates on external service.
- **[Bridge Design Pattern:][11]** Defines 2 layers of abstraction. One for the
target which can be extended for different types of receivers and one for the
controls which can be extended to different type of controls that will be able
to communicate with the targets.
- **[Template Design Pattern:][12]** Contains a *usually a final* method that
defines the steps of an algorithm. It allows subclasses to configure the
*template* by overwriting methods.
- **[Iterator Design Pattern:][13]** Provides a uniform way to access different
collection types of objects. For instance, creating an iterator interface that
your collections of Arrays, Lists, or Maps can implement so you can iterate over
them the same way.
- **[Composite Design Pattern:][14]** Allows you to attach individual objects
and a composition of objects uniformly. For example, imagine a folder tree
structure starting at root. This can be the root composite object (aka folder)
where it accepts types of files and types of folders. File types have no child
components attached to them but a folder can have many more files and even more
groupings contained within.
- **[Flyweight Design Pattern:][15]** Used when creating a lot (i.e.: 100,000 or
more) of similar objects. Objects will be created from a factory that checks if
a pre-existing object does not exist that shares a similar definition. If a pre-
existing object exists with a similar configuration then the factory will
return this rather creating a new object and reconfiguring.
- **[State Design Pattern:][16]** Allows an object to change it's behavior when
it's state changes. Each state implements a behavior associated with it's state
of context. Should be implemented with as few states as possible. Ie: Imagine a
database connection that has  two states (connected and disconnected) and a
query method. The connection object execute the query method differently
depending on it's connection state.
- **[Proxy Design Pattern:][17]** Provides a class with limited access to
another class. This is done for security reasons.
- **[Chain of Responsibility Design Pattern:][18]** Sends problem to an object
and if that object can't use it, then it sends it to an object chained to it
that might. The object chained to it can have an additional object chained and
will continue to run it's course until it finds an object that can solve the
problem.
- **[Interpreter Design Pattern:][19]** This pattern solves a problem by using a
context object to interpret an issue and find a class using reflection to return
the answer.
- **[Mediator Design Pattern:][20]** Handles communication between related
objects without having to know anything about each other. Objects are typically
constructed with the mediator passed in. Mediator will regulate interactions.
- **[Memento Design Pattern:][21]** Useful for saving history states of an
object. The object stored in state is referred to as the Memento. Mementos are
managed by caretakers contain a list of each version for retrieval. Lastly, we
have an originator which is responsible for communicating with the caretaker to
save and restore states. Imagine a save, under, and redo scenario.
- **[Visitor Design Pattern:][22]** Allows you to perform the same action on
many objects of different types without much alteration to those classes. A
concrete Visitor class will implement a common visit method for each type of
visitor. Each visitable will implement a Visitable interface that implements an
accept method. Upon usage, each visitable object can pass a type of visitor
object to perform different functions. Extremely useful for creating new ways of
Visitors without touching Visitable classes.

## Further Reading

- **[JavaScript Design Patterns:][23]** A free book by O'Reily showing many of
the above design patterns implemented in JavaScript.
- **[DesignPatternsPHP Projects:][24]** Great code examples of implementing the
above design patterns (and more) in PHP.



[1]: https://www.newthinktank.com/2012/08/observer-design-pattern-tutorial/ "Observer Pattern Tutorial"
[2]: https://www.newthinktank.com/2012/09/factory-design-pattern-tutorial/ "Factory Pattern Tutorial"
[3]: https://www.newthinktank.com/2012/09/abstract-factory-design-pattern/ "Abstract Factory Pattern Tutorial"
[4]: https://www.newthinktank.com/2012/09/singleton-design-pattern-tutorial/ "Observer Pattern Tutorial"
[5]: https://www.newthinktank.com/2012/09/builder-design-pattern-tutorial/ "Builder Pattern Tutorial"
[6]: https://www.newthinktank.com/2012/09/prototype-design-pattern-tutorial/ "Prototype Pattern Tutorial"
[7]: https://www.newthinktank.com/2012/09/decorator-design-pattern-tutorial/ "Decorator Pattern Tutorial"
[8]: https://www.newthinktank.com/2012/09/command-design-pattern-tutorial/ "Command Pattern Tutorial"
[9]: https://www.newthinktank.com/2012/09/adapter-design-pattern-tutorial/ "Adapter Pattern Tutorial"
[10]: https://www.newthinktank.com/2012/09/facade-design-pattern-tutorial/ "Facade Pattern Tutorial"
[11]: https://www.newthinktank.com/2012/10/bridge-design-pattern-tutorial/ "Bridge Pattern Tutorial"
[12]: https://www.newthinktank.com/2012/10/template-method-design-pattern-tutorial/ "Template Method Pattern Tutorial"
[13]: https://www.newthinktank.com/2012/10/iterator-design-pattern-tutorial/ "Iterator Design Pattern Tutorial"
[14]: https://www.newthinktank.com/2012/10/composite-design-pattern-tutorial/ "Composite Design Pattern Tutorial"
[15]: https://www.newthinktank.com/2012/10/flyweight-design-pattern-tutorial/ "Flyweight Design Pattern Tutorial"
[16]: https://www.newthinktank.com/2012/10/state-design-pattern-tutorial/ "State Design Pattern Tutorial"
[17]: https://www.newthinktank.com/2012/10/proxy-design-pattern-tutorial/ "Proxy Design Pattern Tutorial"
[18]: https://www.newthinktank.com/2012/10/chain-of-responsibility-design-pattern-tutorial/ "Chain of Responsibility Design Pattern Tutorial"
[19]: https://www.newthinktank.com/2012/10/interpreter-design-pattern-tutorial/ "Interpreter Design Pattern Tutorial"
[20]: https://www.newthinktank.com/2012/10/mediator-design-pattern-tutorial/ "Mediator Design Pattern Tutorial"
[21]: https://www.newthinktank.com/2012/10/memento-design-pattern-tutorial/ "Memento Design Pattern Tutorial"
[22]: https://www.newthinktank.com/2012/11/visitor-design-pattern-tutorial/ "Visitor Design Pattern Tutorial"

[23]: https://addyosmani.com/resources/essentialjsdesignpatterns/book/ "Essential JavaScript Design Patterns"
[24]: https://github.com/domnikl/DesignPatternsPHP "Design Patterns PHP Project"
