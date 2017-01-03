require "logger_ext/version"
require "logger"

class Logger
  private

  def log_with_options(severity, *args, &block)
    return unless level <= severity

    if block
      # Note: this will raise an error if args is not empty
      add severity, nil, *args, &block
    else
      add severity, format_message_with_options(*args), nil
    end
  end

  def format_message_with_options(message, *args)
    message += ": #{args.shift.inspect}" unless args.empty?
    args.each_with_index do |arg, idx|
      message += ", #{arg.inspect}"
    end
    message
  end

  public

  # Log a +DEBUG+ message.
  def debug(*args, &block)
    log_with_options(DEBUG, *args, &block)
  end

  # Log an +INFO+ message.
  def info(*args, &block)
    log_with_options(INFO, *args, &block)
  end

  # Log a +WARN+ message.
  def warn(*args, &block)
    log_with_options(WARN, *args, &block)
  end

  # Log an +ERROR+ message.
  def error(*args, &block)
    log_with_options(ERROR, *args, &block)
  end

  # Log a +FATAL+ message.
  def fatal(*args, &block)
    log_with_options(FATAL, *args, &block)
  end

  # Log an +UNKNOWN+ message.
  def unknown(*args, &block)
    log_with_options(UNKNOWN, *args, &block)
  end
end
