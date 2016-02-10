# coding: utf-8
require 'thread'
require "benchmark"

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
  puts "Enter the file name to enter"
  STDOUT.flush
  file_name = gets.chomp
  puts "File name is " + file_name
  fname = "sample.txt"
  somefile = File.open(fname, "w")
  ["shark","fish","seats","iteration"].each do |input|
    puts "Enter #{input}"
    shark = gets.chomp
    somefile.puts shark
  end
  somefile.close
  sem = Semaphore.new(1)
  problem = Syncproblem.new(2,3,4,6)
  problem.sharks
  
  threads = Array.new(8) do |i|
    Thread.start do
      puts "#{i} trying to enter…"
      sem.synchronize do
        time = Benchmark.realtime do
          puts "#{i} has entered!"
          puts Thread.list.select {|thread| thread.status == "run"}.count
          sleep 1
        end
        puts "#{i} process took to #{time} execute"
      end
      sleep 1
      puts "#{i} has left!"
    end
  end
  threads.map(&:join)
end

def time_method(method, *args)
  beginning_time = Time.now
  self.send(method, args)
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end
