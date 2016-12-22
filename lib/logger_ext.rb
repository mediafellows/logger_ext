require "logger_ext/version"
require "logger"

class Logger
  private

  def add_structured_entry(severity, message, *args, &block)
    return unless level <= severity

    if block
      # Note: this will raise an error if args is not empty
      add severity, nil, message, *args, &block
    else
      add severity, format_structured_entry(message, *args), nil
    end
  end

  def format_structured_entry(message, *args)
    message += ": #{args.shift.inspect}" unless args.empty?
    args.each_with_index do |arg, idx|
      message += ", #{arg.inspect}"
    end
    message
  end

  public

  # Log a +DEBUG+ message.
  def debug(message, *args, &block)
    add_structured_entry(DEBUG, message, *args, &block)
  end

  # Log an +INFO+ message.
  def info(message, *args, &block)
    add_structured_entry(INFO, message, *args, &block)
  end

  # Log a +WARN+ message.
  def warn(message, *args, &block)
    add_structured_entry(WARN, message, *args, &block)
  end

  # Log an +ERROR+ message.
  def error(message, *args, &block)
    add_structured_entry(ERROR, message, *args, &block)
  end

  # Log a +FATAL+ message.
  def fatal(message, *args, &block)
    add_structured_entry(FATAL, message, *args, &block)
  end

  # Log an +UNKNOWN+ message.
  def unknown(message, *args, &block)
    add_structured_entry(UNKNOWN, message, *args, &block)
  end
end
