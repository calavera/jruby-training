require 'spec_helper'
import "es.agilismo.katas.pomodoro.Pomodoro"

describe "a Pomodoro" do

  it "goes on 25 minutes by default" do
    Pomodoro.new.minutes_left.should == 25
  end

  it "accepts any positive amount of time as duration" do
    Pomodoro.new(30).minutes_left.should == 30
  end

  it "goes on the default duration for any negative amount of time" do
    Pomodoro.new(-30).minutes_left.should == 25
  end

  it "accepts 0 as duration" do
    Pomodoro.new(0).minutes_left.should == 0
  end

  it "is stopped by default" do
    Pomodoro.new.has_started.should be_false
  end

  it "is started by the user" do
    pomodoro = start_pomodoro
    pomodoro.has_started.should be_true
  end

  it "begins the countdown after starting" do
    pomodoro = start_pomodoro

    wait_a_moment
    pomodoro.minutes_left.should == 24
  end

  it "doesn't continue when the countdown arrives to 0" do
    pomodoro = start_pomodoro(0)
    wait_a_moment
    pomodoro.minutes_left.should == 0
  end

  it "can't finish if it's not started" do
    Pomodoro.new.should_not be_finished
  end

  it "is finished when the countdown arrives to 0" do
    pomodoro = start_pomodoro(0)
    wait_a_moment
    pomodoro.should be_finished
  end

  it "doesn't finish while the countdown is running" do
    pomodoro = start_pomodoro(1)
    wait_a_moment
    pomodoro.should_not be_finished
  end

  it "is initialized without interruptions" do
    Pomodoro.new.number_of_interruptions.should == 0
  end

  it "can't be interrupted if it's not started" do
    pomodoro = Pomodoro.new
    pomodoro.interrupt
    pomodoro.number_of_interruptions.should == 0
  end

  it "can be interrupted if it's started" do
    pomodoro = start_pomodoro
    pomodoro.interrupt
    pomodoro.number_of_interruptions.should == 1
  end

  it "counts the number of interruptions" do
    pomodoro = start_pomodoro
    pomodoro.interrupt
    pomodoro.interrupt
    pomodoro.number_of_interruptions.should == 2
  end

  it "is reset when we start it again" do
    reset_pomodoro.minutes_left.should == 30
  end

  it "is reset without interruptions" do
    reset_pomodoro.number_of_interruptions.should == 0
  end

  def reset_pomodoro
    pomodoro = start_pomodoro(30)
    wait_a_moment

    pomodoro.interrupt
    pomodoro.start
    pomodoro
  end

  def start_pomodoro(minutes = -1)
    pomodoro = Pomodoro.new(minutes)
    pomodoro.start
    pomodoro
  end

  def wait_a_moment
    java.lang.Thread.sleep 343
  end
end
