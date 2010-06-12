require File.expand_path('../test_helper', File.dirname(__FILE__))

class PersonTest < ActiveSupport::TestCase
  def setup
    Neo4j::Transaction.new
  end

  def teardown
    Neo4j::Transaction.failure
    Neo4j::Transaction.finish
  end

  test "a person can be created by her name" do
    person = Person.create('foo')
    assert_equal 'foo', person.name
  end

  test "a person can be found by name" do
    Person.create('foo')
    assert_not_nil Person.find_by_name('foo')
  end

  test "two people are friends with each other" do
    foo = Person.create('foo')
    bar = Person.create('bar')

    Person.know_each_other(foo, bar)

    assert foo.friends.depth(:all).include?(bar)
    assert bar.friends.depth(:all).include?(foo)
  end

  test "the separation between the same person is -1" do
    foo = Person.create('foo')

    assert_equal -1, foo.find_separation(foo)
  end

  test "the separation between two unknown people is 0" do
    foo = Person.create('foo')
    bar = Person.create('bar')

    assert_equal 0, foo.find_separation(bar)
  end

  test "the separation between two friends is 1" do
    foo = Person.create('foo')
    bar = Person.create('bar')

    Person.know_each_other(foo, bar)
    assert_equal 1, foo.find_separation(bar)
  end

  test "the separation between me and a friend of a friend is 2" do
    foo = Person.create('foo')
    bar = Person.create('bar')
    baz = Person.create('baz')

    Person.know_each_other(foo, bar)
    Person.know_each_other(bar, baz)

    assert_equal 2, foo.find_separation(baz)
  end
end
