# frozen_string_literal: true

require_relative "nkn/version"

module Nkn
  class Error < StandardError; end

  def self.run(source, out: $stdout)
    execute(parse(source), out: out)
  end

  INSTRUCTIONS = ["な", "か", "の"].freeze
  private_constant :INSTRUCTIONS

  private_class_method def self.parse(source)
    source.chars.select { |char| INSTRUCTIONS.include?(char) }
  end

  INITIAL_VALUE = 0

  private_class_method def self.execute(instructions, out: $stdout)
    value = INITIAL_VALUE

    instructions.each do |inst|
      case inst
      when "な"
        value += 1
      when "か"
        out.print(value.chr(Encoding::UTF_8))
      when "の"
        value = INITIAL_VALUE
      else
        raise "unexpected instruction: #{inst}"
      end
    end

    value
  end
end
