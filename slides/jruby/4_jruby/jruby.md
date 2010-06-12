!SLIDE

# ¡JRuby is Ruby on steroids!

!SLIDE

# The core classes are written in Java to increase the performance

!SLIDE

# require 'java'

!SLIDE

# Use everything you know about Java but always write Ruby code...

!SLIDE java ruby

    @@@java
    foo = new Foo()

    foo = Foo.new

!SLIDE java ruby

    @@@java
    public Object getFooBar();
    public void setFooBar(Object foo);
    public boolean isFooBar();

    def foo_bar()
    def foo_bar=(foo)
    def foo_bar?

!SLIDE ruby

    @@@ruby
    import java.util.ArrayList
    ArrayList.new

    include_package 'java.util'
    ArrayList.new

!SLIDE ruby

    @@@ruby
    require 'everything_packaged.jar'

    $CLASSPATH << 'org/jruby/Foo.class'

    $ jruby -J-cp everything_packaged.jar

!SLIDE ruby

    @@@ruby
    File.exist? 'foo.jar!/META-INF/MANIFEST.MF'

!SLIDE

# ... and do some conversions when you need it

!SLIDE ruby

    @@@ruby
    public void foo(String[] java_array);



    ruby_array = %w{foo bar baz}
    foo ruby_array.to_java(:string)

!SLIDE java ruby

    @@@java
    public void foo(EventListener event);



    class FooListener
      include java.util.EventListener
    end

    foo FooListener.new

!SLIDE

# One more thing...

!SLIDE

# ...well or perhaps two

!SLIDE

# FFI

## interface your Ruby code with native libraries

!SLIDE ruby

    @@@ruby
    require 'ffi'

    module Hello
      extend FFI::Library
      ffi_lib FFI::Library::LIBC
      attach_function 'puts', [ :string ], :int
    end

    Hello.puts("Hello, World")

!SLIDE

# Generates Java code from Ruby code

!SLIDE

    @@@ruby
    class Foo
      java_signature 'void main(String[])'
      def self.main(args)
        bar(args[0], args[1])
      end

      java_signature 'void bar(int, int)'
      def self.bar(a,b)
        puts a.to_i + b.to_i
      end
    end

!SLIDE

# Ant integration

!SLIDE ruby

    @@@ruby
    require 'ant'

    ant.javac {
      :srcdir => 'src', 
      :destdir => 'target'
    }

!SLIDE

# Lets write some code!
