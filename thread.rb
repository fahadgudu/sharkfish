# coding: utf-8
require 'thread'

class Semaphore
  def initialize(size = 1)
    @queue = SizedQueue.new(size)
    size.times { inc }
  end

  def inc
    tap { @queue.push(nil) }
  end
  alias increment inc
  alias up inc

  def dec
    tap { @queue.pop }
  end
  alias decrement dec
  alias down dec

  # @return [Integer]
  def size
    @queue.length
  end

  def synchronize
    decrement
    yield
  ensure
    increment
  end
end

if $0 == __FILE__
  # Example:
  sem = Semaphore.new(3)

  threads = Array.new(10) do |i|
    Thread.start do
      puts "#{i} trying to enter…"
      sem.synchronize do
        puts "#{i} has entered!"
        sleep 5
      end
      sleep 0.5
      puts "#{i} has left!"
    end
  end

  threads.map(&:join)
end
