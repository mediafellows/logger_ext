require "logger_ext/version"
require "logger"

class Logger
  def add_structured(severity, message, *args, &block)
    return unless level <= severity

    if block
      # Note: this will raise an error if args is not empty
      add severity, nil, message, *args, &block
    else
      message += ": #{args.shift.inspect}" unless args.empty?
      args.each_with_index do |arg, idx|
        message += ", #{arg.inspect}"
      end
      add severity, message, nil
    end
  end

  # Log a +DEBUG+ message.
  def debug(message, *args, &block)
    add_structured(DEBUG, message, *args, &block)
  end

  # Log an +INFO+ message.
  def info(message, *args, &block)
    add_structured(INFO, message, *args, &block)
  end

  # Log a +WARN+ message.
  def warn(message, *args, &block)
    add_structured(WARN, message, *args, &block)
  end

  # Log an +ERROR+ message.
  def error(message, *args, &block)
    add_structured(ERROR, message, *args, &block)
  end

  # Log a +FATAL+ message.
  def fatal(message, *args, &block)
    add_structured(FATAL, message, *args, &block)
  end

  # Log an +UNKNOWN+ message.
  def unknown(message, *args, &block)
    add_structured(UNKNOWN, message, *args, &block)
  end
end
