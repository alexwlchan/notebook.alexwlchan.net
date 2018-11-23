---
layout: post
title: Notes from working through the Ruby Koans
date: 2018-11-23 12:01:12 +0000
tags: ruby
---

Some notes from when I worked through the [Ruby Koans](http://rubykoans.com/).
Grouped by name of the file where I learnt something.

about_asserts.rb:

*   The following are equivalent:

    ```ruby
    assert foo == bar
    assert_equal foo, bar
    ```

about_nil.rb:

*   `nil` is an Object.
*   You can use `foo.nil?` to check if an object is `nil`.
*   You can check for string matches with a regex, e.g.:

    ```ruby
    assert_match(/undefined method/, ex.message)
    ```

about_objects.rb

*   The ID of an object is a `Fixnum`.
*   All objects have a different object ID.
*   Small ints have a fixed object ID.
    See [Object IDs in Ruby](http://thepaulrayner.com/blog/2013/02/06/object-ids-in-ruby/) for more details.

about_arrays.rb

*   There are helper methods `arr.first` and `arr.last`.
*   Array slices work differently to Python: the structure is `arr[index, length]`.
    If the index is out of range, it returns `nil`.
*   Dots work as follows (the opposite of what you expected!):

    ```ruby
    a..b		# a <= i <= b
    a...b	# a <= i < b
    ```

*   More convenience methods and their Python equivalents:

    ```ruby
    arr.unshift(x)		# list.insert(0, x)
    arr.shift			# list.pop(0)
    ```

about_hashes.rb

*   Behaviour is opposite to Python: default hash lookup (`h[key]`) returns `nil` if the key doesn't exist.
    To get an explicit `KeyError`, you need to use `h.fetch(key)`.
*   You can provide default values to get similar behaviour to Python's defaultdict:

    ```ruby
    Hash.new(default)
    Hash.new { |hash, key| hash[key] = default }
    ```

    Be careful about mutating the default!
    In the first line, the same value of `default` is used everywhere, so editing it will affect every key where it's used.

about_strings.rb:

*   You can be flexible about quoting strings if it's helpful, including multi-line strings.

    ```ruby
    %{"I don't have the answer" he said}
    %("I don't have the answer" he said)
    %!"I don't have the answer" he said!
    ```

*   You also have `<<EOS … EOS` if that's helpful.
*   Strings in double quotes are interpolated; strings in single quotes aren't.

about_symbols.rb:

*   A *symbol* is a single, internal, comparable object.
    For example: `:foo` is a symbol, and there's only ever one instance of `:foo`.

about_regular_expressions.rb

*   As well as `^` and `$`, you can use `\A` and `\Z` for anchoring to the start and end, respectively.
*   Characters classes can be negated with capital letters.
    For example, `\D` matches anything that isn't a digit.
*   Regex capture groups are stored in variables `$1, $2! …`.

about_methods.rb

*   Same syntax as Python for variable arguments:

    ```ruby
    def method_with_variable_arguments(*args)
        end
    end
    ```

    But note that `args` becomes an array, not a tuple.

about_keyword_arguments.rb

*   You can do default keyword arguments in Ruby!
    Like so:

    ```ruby
    def method_with_kwargs_with_defaults(one, two: 2, three: 3)
        ...
    end
    ```

about_control_statements.rb

*   You can return a value from `break`.
*   Helper method for repeating an action:

    ```ruby
    10.times
        ...
    end
    ```

about_true_and_false.rb

* Only `false` and `nil` are false-y values; everything else is truth-y (including empty collections and strings).

about_iteration.rb

* `.collect` and `.map` are the same.
* `.select` and `.find_all` are the same.
* `.find` returns the first matching result.
    (Q: what if there's no matching element?
    Does it return `nil`?)
* `.inject` is similar to foldLeft in Scala.

about_blocks.rb

* You can `yield` a value in a block, similar to context managers.
* There's a `block_given?` method that lets you tell if a method was passed a block or not.

about_classes.rb

*   You can use `attr_reader` to automatically define read/write accessor methods for your class:

    ```ruby
    class Dog
        attr_reader :name
    end
    ```

*   The equivalent of `__init__` in Python is `initialize`.

about_open_classes.rb

* You can *open* classes to add extra methods.

about_scope.rb

* If a variable name starts with a capital letter, it's treated as a constant.

about_class_methods.rb

* Class statements return the value of their last expression.

about_message_passing.rb

* You can use `send()` to make dynamic method class.
* You can use `respond_to?` to check if a method is defined.
* Thanks to message sending, calling `obj.foo` is equivalent to `obj.send(:foo)`.
* You can define `method_missing` to catch somebody trying to pass a message to a non-existent method -- but `respond_to?` may start returning incorrect results.
