require "spec_helper"

describe LoggerExt do
  let(:null_file) { File.open "/dev/null", "a" }
  let(:logger) { Logger.new null_file }

  it "can log with the old interface" do
    logger.debug "foo"
    logger.info "foo"
    logger.warn "foo"
    logger.error "foo"
    logger.fatal "foo"
    logger.unknown "foo"
  end

  it "can log with additional arguments" do
    logger.warn "foo", "bar"
    logger.warn "foo", "bar", "baz"
    logger.warn "foo", "bar", hi: "ha"
    logger.warn "foo", hi: "ha"
  end
end
