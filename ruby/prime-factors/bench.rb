RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

require 'benchmark'
require_relative 'prime_factors'

label = 'Tail Recursive'
runs = [
  [60000, 901_255],
  [1200, 799_448_786_163],
  [600, 93_819_012_551],
  [50, 22_801_763_489],
  [1, 28_532_242_330_010_963],
]
s = ->(n) { n.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1_').reverse}
Benchmark.bmbm do |x|
  runs.each do |iterations, number|
    fiterations =
      "%#{ runs.map { |r| r[0].to_s.size }.max }d" % iterations
    fnumber = "%#{ runs.map { |r| s[r[1]].size }.max }s" % s[number]

    x.report("#{label} * #{fiterations} - #{fnumber} ") do
      iterations.times do
        PrimeFactors.for(number)
      end
    end
  end
end
