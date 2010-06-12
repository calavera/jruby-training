!SLIDE

# ¡Ruby!

# Large increase in productivity

!SLIDE

# Designed for humans

# Syntactic sugar

!SLIDE center ruby

# Conventions

    @@@ruby
    ClassNames
    snake_case
    questions?
    warnings!
    @instance_variable
    @@class_variable
    $global_variable

!SLIDE ruby

# Everything is an object

    @@@ruby
    nil.nil?

    5.times { puts 'hello JRuby guys' }

    Class.class

!SLIDE ruby

# Blocks

    @@@ruby
    100.downto(1) do |num|
      puts "#{num} bottles of beer on the wall"
    end

!SLIDE ruby

# Open classes

    @@@ruby
    class String
      def to_pirate
        "#{self}, arrrgggghhh!!!"
      end
    end

!SLIDE ruby

# Method missing

    @@@ruby
    def method_missing(method, *args, &block)
      puts "the method #{method} doesn't exist"
      puts "arrrgggghhh!!!"
    end
