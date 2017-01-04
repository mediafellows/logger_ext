require "logger_ext/version"
require "logger"

class Logger
  class ExtendedMessage
    attr_reader :message
    attr_reader :args

    def initialize(message, *args)
      @message = message
      @args    = args
    end

    def to_s
      if args.length == 0
        message
      else
        s = "#{message}: #{args.shift.inspect}"
        args.each_with_index do |arg, idx|
          next if idx == 0
          s += ", #{arg.inspect}"
        end
        s
      end
    end
  end

  private

  def add_with_options(severity, *args, &block)
    return unless level <= severity

    if block
      # Note: this will raise an error if args is not empty
      add severity, nil, *args, &block
    else
      add severity, ExtendedMessage.new(*args), nil
    end
  end

  public

  # Log a +DEBUG+ message.
  def debug(*args, &block)
    add_with_options(DEBUG, *args, &block)
  end

  # Log an +INFO+ message.
  def info(*args, &block)
    add_with_options(INFO, *args, &block)
  end

  # Log a +WARN+ message.
  def warn(*args, &block)
    add_with_options(WARN, *args, &block)
  end

  # Log an +ERROR+ message.
  def error(*args, &block)
    add_with_options(ERROR, *args, &block)
  end

  # Log a +FATAL+ message.
  def fatal(*args, &block)
    add_with_options(FATAL, *args, &block)
  end

  # Log an +UNKNOWN+ message.
  def unknown(*args, &block)
    add_with_options(UNKNOWN, *args, &block)
  end
end
